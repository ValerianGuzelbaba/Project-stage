<?php

namespace App\Middleware;

class StagiaireMiddleware extends Middleware
{
  // paramètre de vérification du rôle, si non stagiaire alors, retour à la page d'accueil
  public function __invoke($request, $response, $next)
  {
    if ($this->container->sentinel->getUser()) {
      $isStagiaire = $this->container->sentinel->getUser()->inRole('stagiaire');
    }

    if (!$isStagiaire) {
      $this->container->flash->addMessage('erreur', 'Vous n\'avez pas les accès pour voir cette page.');
      return $response->withRedirect($this->container->router->pathFor('home'));
    }

    $response = $next($request, $response);
    return $response;
  }
}