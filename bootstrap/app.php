<?php

// va charger les packages
require __DIR__ . '/../vendor/autoload.php';

// USE 3RD PARTY
use Respect\Validation\Validator as v;

// démarrer une nouvelle session
session_start();

// mise en place de l'application
$settings = require __DIR__ . '/../config/appConfig.php';
$app = new\Slim\App($settings);

// mise en place des dépendances
require __DIR__ . '/../app/dependency.php';

// mise en place du middleware
require __DIR__ . '/../app/middleware.php';

// on ajoute le csrf
$app->add($container->csrf);

// ADD 3RD PARTY
v::with('App\\Validation\\Rules\\');

// mise en place des routes
require __DIR__ . '/../app/routes.php';
