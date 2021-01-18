<?php
    // Connect to database
    require_once './db/database.php';
    $request_method = $_SERVER["REQUEST_METHOD"];

    function getMangas()
    {
        $query = "SELECT * FROM manga LIMIT 50";
        $response = array();
        $stmt = EDatabase::prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
      
    }
    
    function getManga($id=0)
    {
        $query = "SELECT * FROM manga";
        if ($id > 0) {
            $query .= " WHERE id=:id LIMIT 1";
        }
        $response = array();
        $stmt = EDatabase::prepare($query);
        $stmt->execute(array(':id' => $id));
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    $path_info = $_SERVER["PATH_INFO"];
    switch ($request_method) {
        
        case 'GET':
            $matched = array();
            if (preg_match('|/manga/(\d+)|', $path_info, $matched)) {                     # /manga/5
                send_json_response(
                    getManga($matched[1])
                );
            } elseif (preg_match('|/manga/findByAuthor/(\w+)|', $path_info, $matched)) {  # /manga/findByAuthor/oda,miyazaki
                send_json_response(
                    findMangaByAuthors(explode(",", $matched[1]))
                );
            } elseif (preg_match('|/manga/findByAuthor|', $path_info, $matched)) {  # /manga/findByAuthor?author=oda,miyazaki
                send_json_response(
                    findMangaByAuthors(explode(",", $_GET["author"]))
                );
            } elseif (preg_match('|/manga/findByGenre|', $path_info, $matched)) {  # /manga/findByGenre?genre=oda,miyazaki
                send_json_response(
                    findMangaByGenre(explode(",", $_GET["genre"]))
                );
            }
            // } else {
            //     send_json_response(
            //         getMangas()
            //     );
            // }
            break;

        case 'POST':
            // Ajouter un manga
            AddManga();
            break;

        case 'DELETE':
            // Supprimer un manga
            if (intval($_GET["id"])) {
                deleteManga($id);
            }
            break;

        case 'PUT':
            // Modifier un manga
            updateManga();
            break;

        default:
            // Invalid Request Method
            header("HTTP/1.0 405 Method Not Allowed");
            break;

    }

    function mockMangaList()
    {
        $manga1 = array(
            "author" => "oda",
            "title" => "One Piece"
        );
        $manga2 = array(
            "author" => "Miyazaki",
            "title" => "Spirited away"
        );
        return [
            $manga1,
            $manga2
        ];
    }

    function findMangaByAuthors($authors)
    {
        $query = "SELECT * FROM manga m INNER JOIN `write` w ON m.id = w.idmanga INNER JOIN author a ON a.id = w.idauthor ";
        if ($authors != "") {
            $query .= " WHERE a.first_name or a.last_name LIKE :authors";
        }
        $response = array();
        $stmt = EDatabase::prepare($query);
        $stmt->execute(array(':authors' => $authors[0]));
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    function findMangaByGenre($genres)
    {
        $query = "SELECT * FROM manga m INNER JOIN `classify` c ON m.id = c.idmanga INNER JOIN genre g ON g.id = c.idgenre ";
        if ($genres[0] != "") {
            $query .= " WHERE a.name LIKE :genres";
        }
        $response = array();
        $stmt = EDatabase::prepare($query);
        $stmt->execute(array(':genres' => $genres[0]));
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }


    function deleteManga($id)
    {
        $query="delete from manga where id=:id";
        $stmt = EDatabase::prepare($query);
        $stmt->execute(array(':id' => $id));
    }


    function send_json_response($struct)
    {
        header('Content-Type: application/json');
        echo json_encode($struct, JSON_INVALID_UTF8_SUBSTITUTE);
    }
