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
