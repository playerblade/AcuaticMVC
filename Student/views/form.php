 <div class="container mt-md-5">
    <div class="card-body">
        <div class="card-header">
            <h2 class="text-light">Registrar Estudiante</h2>
        </div>
        <div class="card-header">
            <form role="form" action="<?= $action ?>" method="post">
                <table class="align-content-center table table-responsive-lg table-striped ">
                    <tr class="text-light">
                        <th>

                            <label>Primer Nombre</label>
                            <input type="text" name="primerNombre" value="<?= $student['primerNombre'] ?? "" ?>" class="form-control" required/>

                            <label> Segundo Nombre </label>
                            <input type="text" name="segundoNombre" value="<?= $student['segundoNombre'] ?? "" ?>" class="form-control" />

                            <label> Apellido Paterno </label>
                            <input type="text" name="apellidoPaterno" value="<?= $student['apellidoPaterno'] ?? "" ?>" class="form-control" required/>

                            <label> Apellido Materno </label>
                            <input type="text" name="apellidoMaterno" value="<?= $student['apellidoMaterno'] ?? "" ?>" class="form-control" />

                            <br>
                            <button type="submit" class="btn btn-primary">Accept</button>
                        </th>
                        <th>
                           <label> Ci Estudiante </label>
                            <input type="text" name="ciEstudiante" id="ciEstudiante" value="<?= $student['ciEstudiante'] ?? "" ?>" class="form-control" required>

                            <label> Fecha De Nacimiento </label>
                            <input type="date" name="fechaNacimiento" value="<?= $student['fechaNacimiento'] ?? "" ?>" class="form-control" required/>

                            <label> Direccion </label>
                            <input type="text" name="direccion" value="<?= $student['direccion'] ?? "" ?>" class="form-control" required/>
                            <br>
                            <label> Genero </label><br>
                            <input type="radio" name="genero" value="M" required/> Maculino
                            <input type="radio" name="genero" value="F"  required/> Femenino
                        </th>
                    </tr>
<!--                    START TUTOR-->

                </table>
            </form>
        </div>
    </div>
</div>
