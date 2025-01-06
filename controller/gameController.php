<?php 
    $title = "Des jeux";
    $subtitle = "Pour se muscler l'esprit";

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
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silence On Lit</title>
    <link rel="stylesheet" href="../style/style.css">
    <script type="module" src="../script/test.js"></script>
    <script type="module" src="../script/nav.js"></script>
</head>
<body>
    <header>
        <img src="../asset/logo.png" alt="logo E2C" id="logo">
        <div id="titres">
            <h1>Silence on lit à l'E2C</h1>
            <h2>Espace jeux</h2>
        </div>
    </header>

    <?php
        require_once("../module/_header.php");
        require_once("../module/_nav.php");
    ?>

    <main>
        <p id="result"></p>
        <div>
            <label for="Number1">Premier nombre</label>
            <input type="number" name="Number1" id="Number1">
        </div>
        <div>
            <label for="Number2">Deuxième nombre</label>
            <input type="number" name="Number2" id="Number2">
        </div>
        <div>
            <input type="submit" value="Calculer" id="calculate">
        </div>
    </main>
    <div id="trigger"></div>
</body>
</html>