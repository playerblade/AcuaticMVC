<?php
namespace Auth;
class Auth
{
    public static function check($data)
    {
        $db = getConnectionDB();
        $sql = "SELECT * FROM usuario
                WHERE usuario = :user
                AND contrasenia = :psswd;
                "; // add idRol
        $stm= $db->prepare($sql);

        $stm->bindParam(':user',$data['usuario']);
        $password = sha1($data['contrasenia']);
        $stm->bindParam(':psswd',$password);//add sh1 for encryptation

        $stm->execute();
        $user = $stm->fetch();

        return $user ?? false;

    }
}
