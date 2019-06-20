<!-- i here need student create after -->
<a href="<?= Route::link("/student/create")?>">
    Add Student
</a>
<h2>List of Students</h2>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Ci</td>
        <td>Primer nombre</td>
        <td>Apellido Paterno</td>
        <td>Direccion</td>
        <td>Celular</td>
        <td>Fecha De Nacimiento</td>
        <td>Genero</td>
        <td>Opciones</td>
    </tr>

    <?php foreach ($data as $student) {?>
        <tr>
            <td>
                <?= $student['idEstudiante']?>
            </td>
            <td>
                <?= $student['ciEstudiante']?>
            </td>
            <td>
                <?= $student['primerNombre']?>
            </td>
            <td>
                <?= $student['apellidoPaterno']?>
            </td>
            <td>
                <?= $student['direccion']?>
            </td>
            <td>
                <?= $student['numeroCelular']?>
            </td>
            <td>
                <?= $student['fechaNacimiento']?>
            </td>
            <td>
                <?= $student['genero']?>
            </td>
            <td>
                <a href="<?=Route::link("/student/{$student['idEstudiante']}/show") ?>"> <!--la manera correcta puede ser  despues /show-->
                    &#x1f50D <!--this is show-->
                </a>
                <a href="<?=Route::link("/student/{$student['idEstudiante']}/edit") ?>">
                    &#9998 <!--this is edit-->
                </a>
                <a href="<?= Route::link("/student/{$student['idEstudiante']}/delete") ?>">
                    &#10008 <!--this is delete-->
                </a>
            </td>
        </tr>
    <?php }?>
</table>