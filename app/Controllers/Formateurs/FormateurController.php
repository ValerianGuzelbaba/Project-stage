<?php

namespace App\Controllers\Formateurs;

use App\Models\User;
use App\Controllers\Controller;
use Slim\Views\Twig as View;

class FormateurController extends Controller
{
  // fonction pour définir la réponse de la page une fois connecté en tant que formateur
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