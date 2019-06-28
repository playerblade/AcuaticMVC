<?php

namespace Student;

class Controller
{
    protected $student;

    function __construct()
    {
        $this->student = new Student();
    }

    function index()
    {
        $data = $this->student->all();
        view("./Student/views/index.php",['data'=>$data]);
    }
    function show($id)
    {
        $student = $this->student->get($id);
        view("./Student/views/show.php",['student' => $student]);
    }
    function create()
    {
        $params = [
            'action' => \Route::link("/student/store")
        ];
        view("./Student/views/form.php",$params);
    }
    function store($data)
    {
        $this->student->add($data);
        redirect(\Route::link('/student'));
    }
    function edit($id)
    {
        $data = [
            'action' => \Route::link("/student/{$id}/update"),
            'student' => $this->student->get($id)
        ];
        view("./Student/views/form.php",$data);
    }
    function update($id,$data)
    {
        $this->student->update($id,$data);
        redirect(\Route::link('/student'));
    }
    function delete($id)
    {
        $this->student->delete($id);
        redirect(\Route::link('/student'));
    }
}