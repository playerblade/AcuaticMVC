<!-- i here need student create after -->
<div class="card-body">
<a href="<?= Route::link("/student/create")?>">
    Add Student
</a>
<h2>List of Students</h2>
            <!-- AQUI ESTARA LA LISTA DE ESTUDINTES -->
            <table class="table table-striped">     <!--style="width: 80%;"--> <!--PONEER FOREACH--->
                <thead class="thead-dark">
                    <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Ci</th>
                    <th scope="col">Primer nombre</th>
                    <th scope="col">Apellido Paterno</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Fecha De Nacimiento</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <?php foreach ($data as $student) {?>
                <tbody>
                    <tr>
                        <td>
                            <?= $student['id']?>
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
                            <?= $student['fechaNacimiento']?>
                        </td>
                        <td>
                            <?= $student['genero']?>
                        </td>
                        <td>
                            <a href="<?=Route::link("/student/{$student['id']}/show") ?>"> <!--la manera correcta puede ser  despues /show-->
                                &#x1f50D <!--this is show-->
                            </a>
                            <a href="<?=Route::link("/student/{$student['id']}/edit") ?>">
                                &#9998 <!--this is edit-->
                            </a>
                            <a href="<?= Route::link("/student/{$student['id']}/delete") ?>">
                                &#10008 <!--this is delete-->
                            </a>
                        </td>
                    </tr>
                </tbody>
                <?php }?>
            </table>
        </div>