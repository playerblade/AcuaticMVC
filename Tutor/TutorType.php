<?php
namespace Tutor;
class TutorType
{
    public static function all()
    {
        $db = getConnectionDB();
        $sql = "SELECT * FROM tipotutor";
        $stm = $db->prepare($sql);
        $stm->execute();
        return $data =  $stm->fetchAll();
    }

    public  static function getAllForSelect($tutorTypeId =0){
        $tutorTypes = self::all();
        foreach ($tutorTypes as &$tutorType){
            $tutorType['selected']= $tutorType['id'] == $tutorTypeId ? "selected" : "";
        }
        return $tutorTypes;
    }
}
