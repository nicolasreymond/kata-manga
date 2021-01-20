<?php
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
  <style>

    table, td, th {
      border: 1px solid black;
    }

  table {
    width: 100%;
    border-collapse: collapse;
  }
  ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: #111;
}
  </style>
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
  <h1 class="">Voici où se trouvera le tableau de manga</h1>

  <?=make_content($_GET['id'])?>


</div>
