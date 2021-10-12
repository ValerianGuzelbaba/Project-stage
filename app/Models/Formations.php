<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Formations extends Model {

    protected $table = 'formations';
    
    protected $fillable = [
        'titre_formation',
        'description_formation',
        'duree_formation'
    ];
}
