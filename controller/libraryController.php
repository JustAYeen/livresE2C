<?php 
    session_start();
    $title = "Faites votre choix";
    $subtitle = "Il y en a pour tout le monde";

    $navButtons = [
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
    ];

    if ($_SESSION["id"]) {
        $navButtons[]= [
            "label" => "Mon compte",
            "path" => "../controller/accountController.php"
            ];
    }

    require_once("../view/libraryView.php");