<?php

namespace App\Controllers;

use Slim\Views\Twig as View;

class HomeController extends Controller
{
  // retourne la page par défaut auquel on fait appel
  public function index($request, $response)
  {
    return $this->view->render($response, 'home.twig');
  }
}
