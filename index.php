<?php
include "loader.php";

Route::get('/','\\Home\\Controller@index');

// start Student - Comienzo de Estudiante
Route::get('/student','\\Student\\Controller@index');

Route::get('/student/create','\\Student\\Controller@create');  //create
//store
Route::get('/student/{id}/show','\\Student\\Controller@show'); //show
Route::get('/student/{id}/edit','\\Student\\Controller@edit');
Route::post('/student/{id}/update','\\Student\\Controller@update');
Route::get('/student/{id}/delete','\\Student\\Controller@delete');

throw new Error("Route is not defined!");