<div class="container mt-md-5">
<div class="card-body">
    <div class="card-header">
        <a href="<?= Route::link("/student/create")?>" class="btn btn-primary btn-lg">
            &#x271a
        </a>
        <h2 class="text-light">Lista De Estudiantes</h2>
    </div>
    <div class="card-header">
        <table class="table table-responsive-lg table-striped "  > <!--table table-striped-->
            <thead class="thead-dark">
                <tr>
                <th scope="col">Id</th>
                <th scope="col">Ci</th>
                <th scope="col">Estudiante</th>
                <th scope="col">Direccion</th>
                <th scope="col">Fecha De Nacimiento</th>
                <th scope="col">Genero</th>
<!--                <th scope="col">Tutor</th>-->
                <th scope="col">Opciones</th>
                </tr>
            </thead>
                    
            <tbody class="alert-link">
                <?php foreach ($data as $student) {?>
                    <tr class="text-light">
                        <td>
                            <?= $student['id']?>
                        </td>
                        <td>
                            <?= $student['ciEstudiante']?>
                        </td>
                        <td>
                            <?= $student['estudiante']?>
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
<!--                        <td>-->
<!--                            --><?//= $student ['tutor'] ?>
<!--                        </td>-->
                        <td>
                            <a href="<?=Route::link("/student/{$student['id']}/show") ?>"class="btn btn-primary btn-sm"> <!--la manera correcta puede ser  despues /show-->
                                &#x1f50D <!--this is show-->
                            </a>
                            <a href="<?=Route::link("/student/{$student['id']}/edit") ?>"class="btn btn-warning btn-sm">
                                &#9998 <!--this is edit-->
                            </a>
                            <a href="<?= Route::link("/student/{$student['id']}/delete") ?> "class="btn btn-danger btn-sm">
                                &#x2716<!--this is delete-->
                            </a>
                        </td>
                    </tr>
                <?php }?>
            </tbody>
        </table>
    </div>
</div>
</div>

