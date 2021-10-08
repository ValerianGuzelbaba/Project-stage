<?php
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
                'host' => 'localhost',
                'name' => 'gestform',
                'user' => 'root',
                'pass' => 'root',
                'port' => '3306',
                'charset' => 'utf8',
            ],
            'development' => [
                'adapter' => 'mysql',
                'host' => 'localhost',
                'name' => 'gestform',
                'user' => 'root',
                'pass' => 'root',
                'port' => '3306',
                'charset' => 'utf8',
            ]
        ],
        'version_order' => 'creation'
    ];
