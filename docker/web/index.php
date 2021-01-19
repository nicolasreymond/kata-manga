<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// require("api_function.php");
// construct the query with our apikey and the query we want to make
$endpoint = 'http://localhost:1337/api/object/api.php/manga/';
// setup curl to make a call to the endpoint


    function getJoke($firstName, $lastName)
    {
        //http://api.icndb.com/jokes/random
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://api.icndb.com/jokes/random?firstName=" . $firstName . "&lastName=" . $lastName);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPGET, 1);
        
        $JokeJSON = curl_exec($ch);
        if ($JokeJSON == false) {
            die("cURL Error: " . curl_error($ch));
        }
        
        $JokeObj = json_decode($JokeJSON, true);
        return $JokeObj['value']['joke'];
    }
    
    function getManga($id)
    {
        //http://api.icndb.com/jokes/random
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://web:8080/api/object/api.php/manga/" . $id);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPGET, 1);
        
        $MangaJSON = curl_exec($ch);
        echo $MangaJSON;
        if ($MangaJSON == false) {
            die("cURL Error: " . curl_error($ch));
        }
        
        $JokeObj = json_decode($MangaJSON, true);
        echo $JokeObj;
        return $JokeObj[0]['id'];
    }

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
                <li><a href="API">API</a></li>
            </ul>
        </div>  
    </div>
  </div><?php
?>
<div class="grille">
  <h1 class="">Voici quelques test d'api</h1>
<?=getJoke("Nicolas", "Reymond")?>
<br>
<?=getManga(7)?>

</div>
