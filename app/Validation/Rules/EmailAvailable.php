<?php

namespace App\Validation\Rules;

use App\Models\User;
use Respect\Validation\Rules\AbstractRule;

class EmailAvailable extends AbstractRule
{
  // on vérifie la validité du format de l'email
  public function validate($input)
  {
    return User::where('email', $input)->count() === 0;
  }
}
