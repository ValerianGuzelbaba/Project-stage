<?php

namespace App\Models;

use Cartalyst\Sentinel\Users\EloquentUser as SentinelUser;

class User extends SentinelUser
{
  // on établit les lignes de la tables qui sont éditées
  protected $table = 'users';
  
  protected $fillable = [
    'username',
    'displayname',
    'email',
    'password',
    'permissions'
  ];

  protected $loginNames = ['email', 'username'];
}
