<?php

namespace App\Controllers\Auth;

use App\Models\User;
use App\Controllers\Controller;
use Respect\Validation\Validator as v;

class AuthController extends Controller
{
  public function getLogin($request, $response)
  {
    return $this->view->render($response, 'templates/login.twig');
  }

  public function postLogin($request, $response)
  {
    $credentials = [
      'username' => $request->getParam('username'),
      'password' => $request->getParam('password')
    ];

    $attempt = $this->container->sentinel->authenticate($credentials);

    if (!$attempt) {
      $this->flash->addMessage('erreur', "Une erreur s'est produite lors de votre connexion. Veuillez vérifier vos informations d'identification.");
      return $response->withRedirect($this->router->pathFor('user.login'));
    } else {
      $this->container->sentinel->login($attempt);
      
      if ($this->container->sentinel->getUser()) {
        $isAdmin = $this->container->sentinel->getUser()->inRole('admin');
      }
      
      if($isAdmin){
        return $response->withRedirect($this->router->pathFor('admin.index'));
      }

      if ($this->container->sentinel->getUser()) {
        $isFormateur = $this->container->sentinel->getUser()->inRole('formateur');
      }
      
      if($isFormateur){
        return $response->withRedirect($this->router->pathFor('formateur.index'));
      }

      if ($this->container->sentinel->getUser()) {
        $isStagiaire = $this->container->sentinel->getUser()->inRole('stagiaire');
      }
      
      if($isStagiaire){
        return $response->withRedirect($this->router->pathFor('stagiaire.index'));
      }

      return $response->withRedirect($this->router->pathFor('home'));
    }
  }

  public function logout($request, $response)
  {
    $this->container->sentinel->logout();
    return $response->withRedirect($this->router->pathFor('home'));
  }
}
