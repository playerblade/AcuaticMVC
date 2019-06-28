<?php
namespace Tutor;
class Tutor
{
    public static function all()
    {
        $db = getConnectionDB();
        $sql = "SELECT t.*, tt.nombre
                FROM tutor t LEFT JOIN tipotutor tt ON t.idTipoTutor = tt.id
                ";
        $stm = $db->prepare($sql);
        $stm->execute();

        $tutors= $stm->fetchAll();

        return $tutors;

    }
    public static function add($data)
    {
        $db = getConnectionDB();
        $sql = "INSERT INTO tutor(ciTutor,primerNombre,segundoNombre,apellidoPaterno,apellidoMaterno,numeroCelular,direccion)
                VALUES (:ciTutor,:primerNombre,:segundoNombre,:apellidoPaterno,:apellidoMaterno,:numeroCelular,:direccion)";
        $stm = $db->prepare($sql);
        $stm->bindParam(":ciTutor",$data['ciTutor']);
        $stm->bindParam(":primerNombre",$data['primerNombre']);
        $stm->bindParam(":segundoNombre",$data['segundoNombre']);
        $stm->bindParam(":apellidoPaterno",$data['apellidoPaterno']);
        $stm->bindParam(":apellidoMaterno",$data['apellidoMaterno']);
        $stm->bindParam(":numeroCelular",$data['numeroCelular']);
        $stm->bindParam(":direccion",$data['direccion']);
        $stm->execute();
        return $db->lastInsertId();
    }
}