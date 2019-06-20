<?php

namespace Student;
class Student
{
    protected $db;

    function __construct()
    {
        $this->db = getConnectionDB();
    }

    function all()
    {
        $sql = "SELECT * FROM estudiante WHERE delete_at IS NULL;"; //I need Make in Data Base
        $stm  = $this->db->prepare($sql);
        $stm->execute();
        return $data = $stm->fetchAll();
    }
    function get($id)
    {
        $sql = "SELECT * FROM estudiante WHERE idEstudiante = :id AND delete_at IS NULL"; //aux= deleted_at
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":id",$id);
        $stm->execute();
        $data = $stm->fetchAll();

        if (!empty($data[0]))
            return $data[0];
        else
            die("No hay Datos o No existe");
    }
    function add($data)
    {
        $sql = "INSERT INTO student(ciEstudiante,primerNombre,fechaNacimiento)
                VALUES (:ciEstudiante,:primerNombre,:fechaNacimiento)";
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":ciEstudiante",$data['ciEstudiante']);
        $stm->bindParam(":primerNombre",$data['primerNombre']);
        $stm->bindParam(":fechaNacimiento",$data['fechaNacimiento']);
        $stm->execute();

        return $this->db->lastInsertId();
    }
    function update($id,$data, $nullOveride = false)
    {
        $sql = "UPDATE estudiante SET primerNombre = :name WHERE idEstudiante = :id;";
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":name",$data['primerNombre']);
        $stm->bindParam(":id",$id);
        $stm->execute();
    }
    function delete($id)
    {
        $sql = "UPDATE estudiante SET delete_at=NOW() WHERE idEstudiante = :id;";
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":id",$id);
        $stm->execute();
    }
}
