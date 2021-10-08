<?php

return [
  'settings' => [
    'determineRouteBeforeAppMiddleware' => true,
    'displayErrorDetails' => true,
    'addContentLengthHeader' => false,

    'db' => [
      'driver'    => 'mysql',
      'host'      => 'localhost',
      'port'      => '3306',
      'database'  => 'gestform',
      'username'  => 'root',
      'password'  => 'root',
      'charset'   => 'utf8',
      'collation' => 'utf8_unicode_ci',
    ]
  ]
];
