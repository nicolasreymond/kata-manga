<?php

function getManga($id = 0)
{
    if ($id > 0) {
        //http://api.icndb.com/jokes/random
      
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://localhost:80/api/object/api.php/manga/" . $id);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPGET, 1);
      
        $MangaJSON = curl_exec($ch);
        // echo $MangaJSON;
        if ($MangaJSON == false) {
            die("cURL Error: " . curl_error($ch));
        }
        $MangaObj = json_decode($MangaJSON, true); 
        if(is_null(getMangaGenre($id))){
          array_push($MangaObj[0], getMangaGenre($id));
        }
        return $MangaObj[0];
    } else {
        $ids = array();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://localhost:80/api/object/api.php/manga");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPGET, 1);
      
        $MangaJSON = curl_exec($ch);
        // echo $MangaJSON;
        if ($MangaJSON == false) {
            die("cURL Error: " . curl_error($ch));
        }
        
        $MangaObj = json_decode($MangaJSON, true);
        // var_dump($MangaObj);
        foreach ($MangaObj as $manga) {
            $ids[] = $manga['id'];
        }

        return $ids;
    }
}

function getMangaGenre($id)
{
  $ids = array();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://localhost:80/api/object/api.php/manga/findGenre/".$id);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPGET, 1);
      
        $GenreJSON = curl_exec($ch);
        // echo $GenreJSON;
        if ($GenreJSON == false) {
            die("cURL Error: " . curl_error($ch));
        }
      
        $GenreObj = json_decode($GenreJSON, true);
        foreach ($GenreObj as $Genre) {
          $ids[] = $Genre['genre_name'];
        }

        return $ids;

}

function make_content($id)
{
    $ids = getManga($id);
    if ($id > 0 && $ids["title"] != "") {
        make_info_page($id);
    } else {
        make_table(0);
    }
}

function make_table()
{
    $ids = getManga(); ?>
    <table>
    <thead>
            <tr>
                <th>id</th>
                <th>title</th>
                <th>status</th>
                <th>start_date</th>
                <th>first_name</th>
                <th>last_name</th>
                <th>name</th>
            </tr>
        </thead>
        <tbody>
    <?php
    foreach ($ids as $id) {
      $manga = getManga($id)
      ?>
      <tr>
          <td><?= $manga['id'] ?></td>
          <td><?= $manga['title'] ?></td>
          <td><?= $manga['status'] ?></td>
          <td><?= $manga['start_date'] ?></td>
          <td><?= $manga['first_name'] ?></td>
          <td><?= $manga['last_name'] ?></td>
          <td><?= $manga['name'] ?></td>
      </tr>
      <?php
         
    } 
    ?>
        </tbody>
    </table>
    <?php
}

function make_info_page($id)
{
  $manga = getManga($id);
  echo $id;
   ?>
   <p><?= $manga['title'] ?></p>

    <img src="<?= $manga['image_url'] ?>" alt="">
    <h1><b><?= $manga['title'] ?></b></h1>
    <p><b>Volumes: </b><?php echo ($manga['num_volumes'] > 0) ? $manga['num_volumes'] : 'Not finished'; ?></p>
    <p><b>Chapitres: </b><?php echo ($manga['num_chapters'] > 0) ? $manga['num_chapters'] : 'Not finished'; ?></p>
    <p><b>Status: </b><?= $manga['status'] ?></p>
    <p><b>Published: </b><?= $manga['start_date'] ?> to <?php echo ($manga['end_date'] != NULL && $manga['end_date'] != '0000-00-00') ? $manga['end_date'] : 'NOW';?> </p>
    <p><b>Genres: </b><?php foreach(getMangaGenre($id) as $genre) { echo $genre." " ; }; ?></p>
    <p><b>Authors: </b><?= $manga['first_name']." ".$manga['last_name'] ?></p>
    <p><b>Magazine: </b><?= $manga['name'] ?></p>

    <h2>Synopsis</h2>
    <p><?= $manga['synopsis'] ?></p>
    <?php
}
