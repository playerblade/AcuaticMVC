<?php
session_start();

include "./config/config.php";
include "./connection.php";
include "./functiones.php";

include "./Core/Route.php";

include "./Home/Controller.php";

include "./Auth/Controller.php";
include "./Auth/Auth.php";

include "./Student/Controller.php";
include "./Student/Student.php";

include "./Tutor/Controller.php";
include "./Tutor/Tutor.php";

include "./Tutor/TutorType.php";


include "./Instructor/Controller.php";
include "./Instructor/Instructor.php";
