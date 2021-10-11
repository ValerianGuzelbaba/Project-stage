<?php

namespace App\Validation\Exceptions;

use Respect\Validation\Exceptions\ValidationException;

class EmailAvailableException extends ValidationException
{
  // fonction pour signaler un e-mail déja utilisé
  public static $defaultTemplates = [
    self::MODE_DEFAULT => [
      self::STANDARD => 'Email déjà utilisé',
    ],
  ];
}
