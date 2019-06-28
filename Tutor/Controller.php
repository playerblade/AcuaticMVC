<?php
namespace Tutor;
use Tutor\TutorType;

class Controller
{
    function index()
    {
        view("./Tutor/views/index.php",[
            'tutors' => Tutor::all()
        ]);
    }
    function create()
    {
        $params =[
            'tutorTypes' => TutorType::getAllForSelect(),
            'action' => \Route::link("/tutor/store")
        ];
        view("./Tutor/views/form.php",$params);
    }
    function store($data)
    {
        Tutor::add($data);// i need clean code
        redirect(\Route::link("/tutor"));// i need clean code
    }

}