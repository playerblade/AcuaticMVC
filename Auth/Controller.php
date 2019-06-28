<?php
namespace Auth;
class Controller
{
    public function login()
    {
        if (!empty($_SESSION['usuario']))
        {
            redirect(\Route::link('/'));
        }
        view("./Auth/views/form.php");
    }
    public function check($data)
    {
        $user = Auth::check($data);
        if ($user){
            $_SESSION['usuario'] = $user;
            redirect(\Route::link('/'));
        }else{
            redirect(\Route::link('/login'));
        }
    }
    public function logout()
    {
        unset($_SESSION['usuario']);
        redirect(\Route::link('/login'));
    }
}