<div class="container mt-md-5">
    <div class="card-body">
        <div class="card-header">
            <h2 class="text-light">Registrar Tutor</h2>
        </div>
        <div class="card-header">
            <form role="form" action="<?= $action ?>" method="post">
                <table class="align-content-center table table-responsive-lg table-striped ">

                    <tr class="text-light">
                        <th>
                            <h3>Tutor</h3>
                            <label> Ci Tutor </label>
                            <input type="text" name="ciTutor" id="ciEstudiante" value="<?= $tutor['ciEstudiante'] ?? "" ?>" class="form-control" required>

                            <label>Primer Nombre</label>
                            <input type="text" name="primerNombre" value="<?= $tutor['primerNombre'] ?? "" ?>" class="form-control" required/>

                            <label> Segundo Nombre </label>
                            <input type="text" name="segundoNombre" value="<?= $tutor['segundoNombre'] ?? "" ?>" class="form-control" required/>

                            <label> Apellido Paterno </label>
                            <input type="text" name="apellidoPaterno" value="<?= $tutor['apellidoPaterno'] ?? "" ?>" class="form-control" required/>
                            <br>
                            <button type="submit" class="btn btn-primary">Accept</button>

                        </th>
                        <th>
                            <br><br>
                            <label> Numero de Celular </label>
                            <input type="text" name="numeroCelular" id="ciEstudiante" value="<?= $tutor['numeroCelular'] ?? "" ?>" class="form-control" required>

                            <label>Direccion</label>
                            <input type="text" name="direccion" value="<?= $tutor['direccion'] ?? "" ?>" class="form-control" required/>

                            <label> Tipo de Tutor </label><br>
                            <select name="idTipoTutor">
                                <option class="0">Select Tutor</option>
                                <?php foreach ($tutorTypes as $tutorType){?>
                                <?php } ?>
                            </select>
                            <input type="text" name="idTipoTutor" value="<?= $tutor['idTipoTutor'] ?? "" ?>" class="form-control" required/>
<!--                            <label> Fotografia</label>-->
<!--                            <input type="text" name="fotografia" value="--><?//= $student['fotografia'] ?? "" ?><!--" class="form-control"/>-->


                        </th>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>