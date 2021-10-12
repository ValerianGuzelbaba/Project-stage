<?php

namespace App\Controllers\Admin;

use App\Models\User;
use App\Models\Roles;
use App\Controllers\Controller;
use Slim\Views\Twig as View;

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
      'roles' => $getCurrentUserRole->slug
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
}