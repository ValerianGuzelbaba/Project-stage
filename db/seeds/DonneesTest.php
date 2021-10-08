<?php

use Phinx\Seed\AbstractSeed;

class DonneesTest extends AbstractSeed
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeders is available here:
     * https://book.cakephp.org/phinx/0/en/seeding.html
     */
    public function run()
    {
        // FORMATIONS
        $data = [
            [
                'id_formation'    => 1,
                'titre_formation'  => 'CDUI',
                'description_formation' => 'Formation pour devenir Concepteur Developpeur UI',
                'duree_formation' => 0
            ], [
                'id_formation'    => 2,
                'titre_formation'  => 'DWWM',
                'description_formation' => 'Formation pour devenir Développeur Web et Web Mobile',
                'duree_formation' => 0
            ]
        ];

        $posts = $this->table('formations');
        $posts->insert($data)
            ->saveData();

        // MODULES
        $data = [
            [
                'id_module'    => 1,
                'titre_module'  => 'CSS',
                'duree_module' => 0,
                'classement_module' => 1,
            ], [
                'id_module'    => 2,
                'titre_module'  => 'HTML',
                'duree_module' => 0,
                'classement_module' => 2,
            ], [
                'id_module'    => 3,
                'titre_module'  => 'Photoshop',
                'duree_module' => 0,
                'classement_module' => 3,
            ], [
                'id_module'    => 4,
                'titre_module'  => 'illustrator',
                'duree_module' => 0,
                'classement_module' => 4,
            ]
        ];

        $posts = $this->table('modules');
        $posts->insert($data)
            ->saveData();

        // FORMATION_MODULE
        $data = [
            [
                'id_formation'    => 1,
                'id_module'  => 1,
            ], [
                'id_formation'    => 1,
                'id_module'  => 2,
            ], [
                'id_formation'    => 1,
                'id_module'  => 3,
            ], [
                'id_formation'    => 1,
                'id_module'  => 4,
            ], [
                'id_formation'    => 2,
                'id_module'  => 1,
            ], [
                'id_formation'    => 2,
                'id_module'  => 2,
            ],
        ];

        $posts = $this->table('formation_module');
        $posts->insert($data)
            ->saveData();

        // SAVOIR FAIRE
        $data = [
            [
                'id_savoir_faire' => 1,
                'id_module'  => 1,
                'titre_savoir_faire' => 'Faire une page responsive',
                'duree_savoir_faire' => 0,
                'classement_savoir_faire' => 1
            ], [
                'id_savoir_faire'    => 2,
                'id_module'  => 1,
                'titre_savoir_faire' => 'Mettre en forme une page',
                'duree_savoir_faire' => 0,
                'classement_savoir_faire' => 2
            ], [
                'id_savoir_faire'    => 3,
                'id_module'  => 2,
                'titre_savoir_faire' => 'Hierarchiser l\'information',
                'duree_savoir_faire' => 0,
                'classement_savoir_faire' => 1
            ], [
                'id_savoir_faire'    => 4,
                'id_module'  => 3,
                'titre_savoir_faire' => 'Détourer une image',
                'duree_savoir_faire' => 0,
                'classement_savoir_faire' => 1
            ], [
                'id_savoir_faire'    => 5,
                'id_module'  => 4,
                'titre_savoir_faire' => 'Utilisation de la plume',
                'duree_savoir_faire' => 0,
                'classement_savoir_faire' => 1
            ], [
                'id_savoir_faire'    => 6,
                'id_module'  => 4,
                'titre_savoir_faire' => 'Vectoriser une image',
                'duree_savoir_faire' => 0,
                'classement_savoir_faire' => 2
            ],
        ];
        $posts = $this->table('savoir_faire');
        $posts->insert($data)
            ->saveData();

        //COMPETENCE
        $data = [
            [
                'id_competence'  => 1,
                'id_savoir_faire' => 1,
                'titre_competence' => 'Les Media Queries',
                'duree_competence' => 0,
                'classement_competence' => 1
            ], [
                'id_competence'  => 2,
                'id_savoir_faire' => 2,
                'titre_competence' => 'Les flexbox',
                'duree_competence' => 0,
                'classement_competence' => 1
            ], [
                'id_competence'  => 3,
                'id_savoir_faire' => 3,
                'titre_competence' => 'Les balises',
                'duree_competence' => 0,
                'classement_competence' => 1
            ], [
                'id_competence'  => 4,
                'id_savoir_faire' => 4,
                'titre_competence' => 'L\'outil de selection rapide',
                'duree_competence' => 0,
                'classement_competence' => 1
            ], [
                'id_competence'  => 5,
                'id_savoir_faire' => 5,
                'titre_competence' => 'Convertir les points d\'ancrage',
                'duree_competence' => 0,
                'classement_competence' => 1
            ], [
                'id_competence'  => 6,
                'id_savoir_faire' => 6,
                'titre_competence' => 'Vectoriser par la',
                'duree_competence' => 0,
                'classement_competence' => 1
            ],
        ];
        $posts = $this->table('competences');
        $posts->insert($data)
            ->saveData();
    }
}
