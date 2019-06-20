<?php
function debug($data){
    echo "<pre>";
    print_r($data);
    die;
}

function dd($data){ debug($data); }

function view($template, $data = []){
    extract($data);
    include "./Core/views/app.php";
}

function redirect($link){
    header("location: $link");
    die;    
}
