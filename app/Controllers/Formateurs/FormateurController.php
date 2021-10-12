<?php

namespace App\Controllers\Admin;

use App\Models\User;
use App\Controllers\Controller;
use Slim\Views\Twig as View;

class FormateurController extends Controller
{
  // fonction pour l'administrateur
  public function index($request, $response)
  {
    $users = User::all();

    $roles = [];
    foreach ($users as $user) {
      $roles[] = $this->container->sentinel->findById($user->id)->roles()->get()->first();
    }

    return $this->view->render($response, 'formateur/home.twig');
  }  
}