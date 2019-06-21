<?php
include "loader.php";

Route::get('/','\\Home\\Controller@index');

// start Student - Comienzo de Estudiante
Route::get('/student','\\Student\\Controller@index');

Route::get('/student/create','\\Student\\Controller@create');  //create
Route::post('/student/store','\\Student\\Controller@store');
Route::get('/student/{id}/show','\\Student\\Controller@show'); //show
Route::get('/student/{id}/edit','\\Student\\Controller@edit');
Route::post('/student/{id}/update','\\Student\\Controller@update');
Route::get('/student/{id}/delete','\\Student\\Controller@delete');

//I need controller student

//fin Students


// Instructor routes
Route::get('/instructor', '\\Instructor\\Controller@index');


throw new Error("Route is not defined!");