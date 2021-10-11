<?php

namespace App\Validation\Exceptions;

use Respect\Validation\Exceptions\ValidationException;

class UserAvailableException extends ValidationException
{
  // fonction qui signale que le nom est déjà utilisé
  public static $defaultTemplates = [
    self::MODE_DEFAULT => [
      self::STANDARD => 'Nom déjà utilisé',
    ],
  ];
}
