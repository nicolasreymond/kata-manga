<?php
    // Connect to database
    require_once './db/database.php';
    $request_method = $_SERVER["REQUEST_METHOD"];

    function getMangas()
    {
        $query = "SELECT * FROM manga order by rank";
        $response = array();
        $stmt = EDatabase::prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    function getMangaInfo($id=0)
    {
        $query = "SELECT * FROM manga m INNER JOIN `write` w ON m.id = w.idmanga INNER JOIN author a ON a.id = w.idauthor 
                                        INNER JOIN `classify` c ON m.id = c.idmanga INNER JOIN genre g ON g.id = c.idgenre
                                        INNER JOIN `publish` p ON m.id = p.idmanga INNER JOIN magazine ma ON ma.id = p.idmagazine";
        if ($id > 0) {
            $query .= " WHERE m.id=:id LIMIT 1";
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
            if (preg_match('|/manga/(\d+)|', $path_info, $matched)) {
                send_json_response(
                    getMangaInfo($matched[1])
                );
            } elseif (preg_match('|/manga/findByAuthor/(\w+)|', $path_info, $matched)) {  # /manga/findByAuthor/oda,miyazaki
                send_json_response(
                    findMangaByAuthors(explode(",", $matched[1]))
                );
            } elseif (preg_match('|/manga/findByAuthor|', $path_info, $matched)) {  # /manga/findByAuthor?author=oda
                send_json_response(
                    findMangaByAuthors($_GET["author"])
                );
            } elseif (preg_match('|/manga/findByGenre|', $path_info, $matched)) {  # /manga/findByGenre?genre=action
                send_json_response(
                    findMangaByGenre(explode(",", $_GET["genre"]))
                );
            } elseif (preg_match('|/manga/findGenre/(\d+)|', $path_info, $matched)) {  # /manga/findGenre/7
                send_json_response(
                    getGenreByID($matched[1])
                );
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

    function getGenreByID($id)
    {
        $query = "SELECT g.name as genre_name From manga m INNER JOIN `classify` c ON m.id = c.idmanga INNER JOIN genre g ON g.id = c.idgenre WHERE m.id = :id";
        $response = array();
        $stmt = EDatabase::prepare($query);
        $stmt->execute(array(':id' => $id));
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    function findMangaByAuthors($authors)
    {
        $query = "SELECT * FROM manga m INNER JOIN `write` w ON m.id = w.idmanga INNER JOIN author a ON a.id = w.idauthor ";
        if ($authors != "") {
            $query .= " WHERE a.first_name or a.last_name LIKE ':authors'";
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
