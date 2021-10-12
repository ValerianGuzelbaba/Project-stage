<?php

namespace App\Auth;

use \App\Models\User;
use \App\Models\Roles;

// fonction pour s'authentifier
class Auth
{
  protected $container;

  public function __construct($container)
  {
    $this->container = $container;
  }
  // fonction pour reconnaître le user en tant qu'admin
  public function isAdmin()
  {
    if ($this->container->sentinel->getUser()) {
      return $this->container->sentinel->getUser()->inRole('admin');
    }
  }
  
  // fonction pour reconnaître le user en tant que formateur
  public function isFormateur()
  {
    if ($this->container->sentinel->getUser()) {
      return $this->container->sentinel->getUser()->inRole('formateur');
    }
  }

  public function roles()
  {
    $roles = Roles::all();
    return $roles;
  }
}
