<?php

namespace App\Middleware;

class FormateurMiddleware extends Middleware
{
  // paramètre de vérification du rôle, si non formateur alors, retour à la page d'accueil
  public function __invoke($request, $response, $next)
  {
    if ($this->container->sentinel->getUser()) {
      $isFormateur = $this->container->sentinel->getUser()->inRole('formateur');
    }

    if (!$isFormateur) {
      $this->container->flash->addMessage('erreur', 'Vous n\'avez pas les accès pour voir cette page.');
      return $response->withRedirect($this->container->router->pathFor('home'));
    }

    $response = $next($request, $response);
    return $response;
  }
}