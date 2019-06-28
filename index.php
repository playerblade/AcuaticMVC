<?php
include "loader.php";

Route::get('/','\\Home\\Controller@index');

//authentification
Route::get('/login','\\Auth\\Controller@login');
Route::post('/login','\\Auth\\Controller@check');
Route::get('/logout','\\Auth\\Controller@logout');

// start Student - Comienzo de Estudiante
Route::get('/student','\\Student\\Controller@index');

Route::get('/student/create','\\Student\\Controller@create');  //create
Route::post('/student/store','\\Student\\Controller@store');
Route::get('/student/{id}/show','\\Student\\Controller@show'); //show
Route::get('/student/{id}/edit','\\Student\\Controller@edit');
Route::post('/student/{id}/update','\\Student\\Controller@update');
Route::get('/student/{id}/delete','\\Student\\Controller@delete');

//Route::get('/student','\\Student\\Controller');
//I need controller student

//fin Students

//start tutors
Route::get('/tutor','\\Tutor\\Controller@index');

Route::get('/tutor/create','\\Tutor\\Controller@create');
Route::post('/tutor/store','\\Tutor\\Controller@store');
//fintutors


// Instructor routes
Route::get('/instructor', '\\Instructor\\Controller@index');


throw new Error("Route is not defined!");