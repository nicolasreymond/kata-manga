<?php
require("api_function.php");
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


?>

<!doctype html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <title>Kata-manga</title>
  <link rel="stylesheet" href="styles/style.css">
  
</head>

<body>
  <div class="head">
    <header>
      <div class=""><a href="index.php">Kata-manga</a></div>
        
    </header>

    <div class="head-content">
        <div class="menu">
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="manga.php">Manga</a></li>
                <li><a href="http://localhost:1337/swagger-ui/dist/index.html">API</a></li>
            </ul>
        </div>  
    </div>
  </div><?php
?>
<div class="grille">
  <h1 class="">Voici où se trouvera le tableau de manga</h1>

  <?=make_content($_GET['id'])?>


</div>
