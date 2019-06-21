<?php 

namespace Instructor;

class Controller{
    
    protected $instructor;

    function __construct(){
        $this->instructor = new Instructor();
    }

    public function index(){
        $data = $this->instructor->getAll();
        view("./Instructor/view/index.php", ['data' => $data]);            
    }



}