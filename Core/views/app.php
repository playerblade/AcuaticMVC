<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-edge, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/AcuaticMVC/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link href="/AcuaticMVC/node_modules/bootstrap/dist/css/simple-sidebar.css" rel="stylesheet">
    <link rel="stylesheet" href="/AcuaticMVC/Resources/style.css">
    <link href="/AcuaticMVC/node_modules/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <title>Acuatic Club</title>
</head>
<body>
    <header class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar bg-dark">
        <!-- Menu toogle -->
        <ul class="navbar-nav bd-navbar-nav flex-row" >
            <li class="nav-item">
                <a class="btn  btn-outline-info my-2 my-sm-0 text-info " id="menu-toggle" style="width: 4rem;" >
                    &#x2630;
                </a>
            </li>
        </ul>

        <li   class="form-inline my-2 my-lg-0  ml-auto"> </li>
        <form class="form-inline my-2 my-lg-0 ">

            <?php if (empty($_SESSION['usuario'])){?>
                <a class="btn btn-outline-info my-2 my-sm-0 " href="<?= Route::link("/login") ?>">
                    Login
                </a>
            <?php } else {?>
                <h5 class="text-light ">
                    <?= $_SESSION['usuario']['primerNombre']?>
                    <h2 class="text-light">&#x263b</h2>
                </h5>
                <a class="btn btn-outline-info my-2 my-sm-0 " href="<?= Route::link("/logout")?>">
                     Logout
                </a>
            <?php }?>

        </form>
    </header>

    <?php
        include("menu.php");
        //include($template);
    ?>

        <script src="/AcuaticMVC/node_modules/jquery/dist/jquery.min.js"></script>
        <script src="/AcuaticMVC/node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="/AcuaticMVC/node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="/AcuaticMVC/node_modules/bootstrap/dist/js/bootstrap.min.js" ></script>

    </body>
</html>
