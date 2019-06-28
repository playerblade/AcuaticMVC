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
        $sql = "SELECT * , Concat(e.primerNombre,' ',e.apellidoPaterno,' ',e.apellidoMaterno)AS estudiante 
                FROM estudiante e
                WHERE deleted_at IS NULL;"; //I need Make in Data Base
        $stm  = $this->db->prepare($sql);
        $stm->execute();
        return $data = $stm->fetchAll();
    }
    function get($id)
    {
        $sql = "SELECT *, Concat(primerNombre,' ',apellidoPaterno,' ',apellidoMaterno) AS estudiante 
                FROM estudiante 
                WHERE id = :id 
                AND deleted_at IS NULL"; //aux= deleted_at
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
        $sql = "INSERT INTO estudiante(ciEstudiante,primerNombre,segundoNombre,apellidoPaterno,apellidoMaterno,direccion,fechaNacimiento,genero)
                VALUES (:ciEstudiante,:primerNombre,:segundoNombre,:apellidoPaterno,:apellidoMaterno,:direccion ,:fechaNacimiento,:genero);";
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":ciEstudiante",$data['ciEstudiante']);
        $stm->bindParam(":primerNombre",$data['primerNombre']);
        $stm->bindParam(":segundoNombre",$data['segundoNombre']);
        $stm->bindParam(":apellidoPaterno",$data['apellidoPaterno']);
        $stm->bindParam(":apellidoMaterno",$data['apellidoMaterno']);
        $stm->bindParam(":direccion",$data['direccion']);
        $stm->bindParam(":fechaNacimiento",$data['fechaNacimiento']);
        $stm->bindParam(":genero",$data['genero']);
        $stm->execute();

        return $this->db->lastInsertId();
    }
    function update($id,$data, $nullOveride = false)
    {
        $sql = "UPDATE estudiante SET primerNombre = :name WHERE id = :id;";
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":name",$data['primerNombre']);
        $stm->bindParam(":id",$id);
        $stm->execute();
    }
    function delete($id)
    {
        $sql = "UPDATE estudiante SET deleted_at=NOW() WHERE id = :id;";
        $stm = $this->db->prepare($sql);
        $stm->bindParam(":id",$id);
        $stm->execute();
    }
}
