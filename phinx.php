<?php
if (is_file(dirname(__FILE__) . '/phinxlocal.php')) {
    return include(dirname(__FILE__) . '/phinxlocal.php');
} else {
    return
        [
            'paths' => [
                'migrations' => __DIR__ . '/db/migrations',
                'seeds' => __DIR__ . '/db/seeds'
            ],
            'environments' => [
                'default_migration_table' => 'phinxlog',
                'default_environment' => 'development',
                'production' => [
                    'adapter' => 'mysql',
                    'host' => '127.0.0.1',
                    'name' => 'gestform',
                    'user' => 'root',
                    'pass' => 'root',
                    'port' => '8889',
                    'charset' => 'utf8',
                ],
                'development' => [
                    'adapter' => 'mysql',
                    'host' => '127.0.0.1',
                    'name' => 'gestform',
                    'user' => 'root',
                    'pass' => 'root',
                    'port' => '8889',
                    'charset' => 'utf8',
                ]
            ],
            'version_order' => 'creation'
        ];
    }