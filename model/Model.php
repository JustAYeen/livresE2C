<?php

class Model {
    private PDO $bdd;

    public function __construct()
    {
        try {
            $this->bdd = new PDO ('mysql:host=localhost;dbname=livres_e2c;charset=utf8','livres_e2c_admin','t98yHS6tDAts44');
        }catch(Exception $e) {
            echo('Problème de connexion : '.$e->getMessage());
        }
    }

    public function getUserByEmail (string $email) {
        $sqlQuery = "SELECT id, pseudo, password FROM User WHERE email = :email";
        $statement = $this->bdd->prepare($sqlQuery);
        $statement->execute([
            'email' => $email
        ]);
        $req = $statement->fetch();//ou fetchAll()

        return $req;
    }

    public function getALLBooks () {
        $sqlQuery = "SELECT titre, auteur, genre, date, id FROM livres_vw";
        $statement = $this->bdd->prepare($sqlQuery);
        $statement->execute();
        $req = $statement->fetchAll();

        return $req;
    }
}