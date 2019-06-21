 <div class="container">
    <div class="card-body">
        <div class="card-header">
            <h2>Registrar Estudiante</h2>
        </div>
        <div class="card-header">
            <form role="form" action="<?= $action ?>" method="post">
                <div class="form-group">
                    <label for="ciInstructor"> Ci Estudiante </label>
                    <input type="text" name="ciEstudiante" id="ciEstudiante" value="<?= $student['primerNombre'] ?? "" ?>" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="idRol"> Primer Nombre </label>
                    <input type="text" name="primerNombre" value="<?= $student['primerNombre'] ?? "" ?>" class="form-control" required/>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Accept</button>
                </div>
            </form>
        </div>
    </div>
</div>
