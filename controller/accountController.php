<?php

$isLogged = false;
if($isLogged) {
$title = "Mon compte";
$subtitle = "Mes infos";

    $navButtons = 
    [
        [
            "label" => "Accueil",
            "path" => "../controller/homeController.php"
        ],
        [
            "label" => "Bibliothèque",
            "path" => "../controller/libraryController.php"
        ],
        [
            "label" => "Espace détente",
            "path" => "../controller/gameController.php"
        ],
        [
            "label" => "Qui sommes nous",
            "path" => "../controller/usController.php"
        ],
        [
            "label" => "Mon compte",
            "path" => "../controller/accountController.php"
    ]
        ];


require_once("../view/accountView.php");
} else {
    header("location: ../controller/homeController.php");
}