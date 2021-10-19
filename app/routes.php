<?php

use App\Middleware\AdminMiddleware;
use App\Middleware\FormateurMiddleware;
use App\Middleware\StagiaireMiddleware;

// route de la page par défaut
$app->get('/', 'HomeController:index')->setName('home');

// route pour la connexion
$app->group('', function() {
  $this->get('/user/login', 'AuthController:getLogin')->setName('user.login');
  $this->post('/user/login', 'AuthController:postLogin');
  $this->get('/user/logout', 'AuthController:logout')->setName('user.logout');
});

// route pour l'administrateur 
$app->group('', function() {
  $this->get('/admin', 'AdminController:index')->setName('admin.index');
  $this->get('/admin/user/add', 'AdminController:index')->setName('admin.user.add');

  $this->get('/admin/user/register', 'UserActionController:getRegister')->setName('admin.user.register');
  $this->post('/admin/user/register', 'UserActionController:postRegister');
  
  $this->get('/admin/user/{uid}/edit', 'UserActionController:editUser')->setName('admin.user.edit');
  $this->post('/admin/user/{uid}/edit', 'UserActionController:postEditUser');

  $this->get('/admin/user/{uid}/delete', 'UserActionController:deleteUser')->setName('admin.user.delete');
})->add(new AdminMiddleware($container));

// route pour le formateur
$app->group('', function() {
  $this->get('/formateur', 'FormateurController:index')->setName('formateur.index');
})->add(new FormateurMiddleware($container));

// route pour le stagiaire
$app->group('', function() {
  $this->get('/stagiaire', 'StagiaireController:index')->setName('stagiaire.index');
})->add(new StagiaireMiddleware($container));
