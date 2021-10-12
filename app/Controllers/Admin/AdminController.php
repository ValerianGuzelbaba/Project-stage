<?php

namespace App\Controllers\Admin;

use App\Models\User;
use App\Controllers\Controller;
use Slim\Views\Twig as View;

class AdminController extends Controller
{
  // fonction pour l'administrateur
  public function index($request, $response)
  {
    $users = User::all();

    $roles = [];
    foreach ($users as $user) {
      $roles[] = $this->container->sentinel->findById($user->id)->roles()->get()->first();
    }

    $this->container->view->getEnvironment()->addGlobal('listUsers', $users);
    $this->container->view->getEnvironment()->addGlobal('getUsersRole', $roles);

    return $this->view->render($response, 'admin/home.twig');
  }

  public function getRegister($request, $response)
  {
    return $this->view->render($response, 'admin/register.twig');
  }

  public function postRegister($request, $response)
  {
    $credentials = [
      'username' => $request->getParam('username'),
      'displayname' => $request->getParam('displayname'),
      'email' => $request->getParam('email'),
      'password' => $request->getParam('password')
    ];

    $validation = $this->validator->validate($request, [
      'username' => v::noWhitespace()->notEmpty()->userAvailable(),
      'email' => v::noWhitespace()->notEmpty()->emailAvailable(),
      'password' => v::noWhitespace()->notEmpty(),
      // 'password_confirm' => v::noWhitespace()->notEmpty() TODO
    ]);

    if ($validation->failed()) {
      return $response->withRedirect($this->router->pathFor('user.register'));
    }

    $user = $this->container->sentinel->registerAndActivate($credentials);

    $role = $this->container->sentinel->findRoleByName('Users');
    $role->users()->attach($users);

    $this->flash->addMessage('succès', 'Vous avez bien été enregistré. Connecte-toi maintenant.');
    return $response->withRedirect($this->router->pathFor('user.login'));
  }
}
