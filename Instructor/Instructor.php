<?php

namespace Instructor;

class Instructor{
    
    protected $db;

    function __construct()
    {
        $this->db = getConnectionDB();
    }

    function getAll(){
        $sql = "SELECT * FROM instructor WHERE deleted_at IS NULL;";
        $stm = $this->db->prepare($sql);
        $stm->execute();
        return $stm->fetchAll();
    }

}
