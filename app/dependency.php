<?php
$container = $app->getContainer();

use \Symfony\Component\HttpFoundation\Request;

// on initialise Eloquent
$capsule = new \Illuminate\Database\Capsule\Manager;
$capsule->addConnection($container['settings']['db']);
$capsule->setAsGlobal();
$capsule->bootEloquent();

// on met en place Twig pour les vues
$container['view'] = function($container) {
  $view = new \Slim\Views\Twig(__DIR__ . '/../resources/views', [
    'cache' => false
  ]);

  $view->addExtension(new \Slim\Views\TwigExtension(
    $container->router,
    $container->request->getUri()
  ));

  $view->getEnvironment()->addGlobal('auth', [
    'check' => $container->sentinel->check(),
    'user' => $container->sentinel->getUser(),
    'isAdmin' => $container->auth->isAdmin(),
    'getRoles' => $container->auth->roles()
  ]);

  $view->getEnvironment()->addGlobal('flash', $container->flash);

  return $view;
};

// raccourci pour utiliser Eloquent
$container['db'] = function($container) use ($capsule) {
  return $capsule;
};

// message flash lors de validation ou d'erreurs
$container['flash'] = function($container) {
  return new \Slim\Flash\Messages;
};

// protection CSRF 
$container['csrf'] = function($container) {
  return new \Slim\Csrf\Guard;
};

$container['hasher'] = function ($container) {
    return new Cartalyst\Sentinel\Hashing\BcryptHasher;
};

$container['dispatcher'] = function ($container) {
    return new Illuminate\Events\Dispatcher;
};

// on ajoute sentinel
$container['sentinel'] = function ($container) {
  $sentinel = (new \Cartalyst\Sentinel\Native\Facades\Sentinel())->getSentinel();
  $sentinel->setUserRepository(
    new \Cartalyst\Sentinel\Users\IlluminateUserRepository(
      $container['hasher'],
      $container['dispatcher'],
      App\Models\User::class // nom de modèle sentinel
    )
  );

  return $sentinel;
};
// validator
$container['validator'] = function($container) {
  return new App\Validation\Validator;
};

$container['auth'] = function($container) {
  return new App\Auth\Auth($container);
};

// controller
$container['HomeController'] = function($container) {
  return new \App\Controllers\HomeController($container);
};

$container['AuthController'] = function($container) {
  return new \App\Controllers\Auth\AuthController($container);
};

$container['AdminController'] = function($container) {
  return new \App\Controllers\Admin\AdminController($container);
};

$container['UserActionController'] = function($container) {
  return new \App\Controllers\Admin\UserActionController($container);
};
