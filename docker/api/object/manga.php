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
            } elseif (preg_match('|/manga/findByAuthor$|', $path_info, $matched)) {  # /manga/findByAuthor?author=oda,miyazaki
                send_json_response(
                    findMangaByAuthors(explode(",", $_GET["author"]))
                );
            } 
            elseif (!empty($_GET["id"])) {
                $id=intval($_GET["id"]);
                getManga($id);
            } else {
                send_json_response(
                    getMangas()
                );
            }
            break;

        case 'POST':
            // Ajouter un manga
            AddManga();
            break;

        case 'DELETE':
            // Supprimer un manga
            $id = intval($_GET["id"]);
            deleteManga($id);
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
