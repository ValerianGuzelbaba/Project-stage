<?php

namespace App\Controllers\Admin;

use App\Models\User;
use App\Models\Roles;
use App\Controllers\Controller;
use Slim\Views\Twig as View;
use Respect\Validation\Validator as v;

class UserActionController extends Controller
{
  // supprimer un utilisateur
  public function deleteUser($request, $response, $arguments)
  {
    if ($arguments['uid'] === $this->container->sentinel->getUser()->username) {
      $this->flash->addMessage('erreur', "Vous ne pouvez pas vous supprimer.");
      return $response->withRedirect($this->router->pathFor('admin.index'));
    }

    $user = User::where('username', $arguments['uid']);
    $user->delete();

    $this->flash->addMessage('succès', "Le stagiaire à bien été supprimé.");
    return $response->withRedirect($this->router->pathFor('admin.index'));
  }

  // ajouter un utilisateur
  public function editUser($request, $response, $arguments)
  {
    $getCurrentUserData = User::where('username', $arguments['uid'])->first();
    $getCurrentUserRole = $this->container->sentinel->findById($getCurrentUserData->id)->roles()->get()->first();

    $this->container->view->getEnvironment()->addGlobal('current', [
      'data' => $getCurrentUserData,
      'role' => $getCurrentUserRole
    ]);

    return $this->view->render($response, 'admin/user/edit.twig');
  }

  public function postEditUser($request, $response, $arguments)
  {
    $getCurrentUserData = User::where('username', $arguments['uid'])->first();
    $getCurrentUserRole = $this->container->sentinel->findById($getCurrentUserData->id)->roles()->get()->first();
    
    var_dump($getCurrentUserRole);
    
    // paramètre de connexion du nouveau utilisateur
    $credentials = [
      'displayname' => $request->getParam('displayname'),
      'email' => $request->getParam('email')
    ];

    // changer mot de passe
    if ($request->getParam('password')) {
      $credentials['password'] = $request->getParam('password');
    }

    // changer rôle utilisateur
    if ($getCurrentUserRole) {
      $role = $this->container->sentinel->findRoleBySlug($getCurrentUserRole->slug);
      $role->users()->detach($getCurrentUserData);
    }

    $role = $this->container->sentinel->findRoleBySlug($request->getParam('role'));
    $role->users()->attach($getCurrentUserData);
    

    // mise à jour de l'utilisateur dans la base de données
    $this->container->sentinel->update($getCurrentUserData, $credentials);

    $this->flash->addMessage('succès', "Les détails ont bien été changés.");
    return $response->withRedirect($this->router->pathFor('admin.user.edit', [ 'uid' => $arguments['uid'] ]));
  }

  public function getRegister($request, $response)
  {
    return $this->view->render($response, 'admin/user/register.twig');
  }

  public function postRegister($request, $response)
  {
    $credentials = [
      'username' => $request->getParam('username'),
      'displayname' => $request->getParam('displayname'),
      'email' => $request->getParam('email'),
      'telephone' => $request->getParam('telephone'),
      'naissance' => $request->getParam('naissance'),
      'adresse' => $request->getParam('adresse'),
      'password' => $request->getParam('password')
    ];

    $validation = $this->validator->validate($request, [
      'username' => v::noWhitespace()->notEmpty()->userAvailable(),
      'email' => v::noWhitespace()->notEmpty()->emailAvailable(),
      'password' => v::noWhitespace()->notEmpty(),
      'telephone' => v::noWhitespace()->notEmpty(),
    ]);

    if ($validation->failed()) {
      return $response->withRedirect($this->router->pathFor('admin.user.register'));
    }

    $user = $this->container->sentinel->registerAndActivate($credentials);

    $role = $this->container->sentinel->findRoleByName('User');
    // $role->users()->attach($user);

    $this->flash->addMessage('succès', 'Vous avez bien enregistré l\'utilisateur.');
    return $response->withRedirect($this->router->pathFor('admin.index'));
  }
}