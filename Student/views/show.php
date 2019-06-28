<div class="container mt-md-5">
    <div class="card-body">
        <div class="card-header">
            <h2 class="text-light">
                Detalles del estudiante
                <a href="<?= Route::link("/student/{$student['id']}/edit")?>" class="btn btn-primary btn-lg">
                    &#9998
                </a>
            </h2>
        </div>
        
        <div class="card-header">
            <div class="card-body">
                <table class="table">
                    <tr>
                        <td>
                            <div class="p-1 mb-0 bg-dark text-white" style="height: 2rem;">
                                <h4>Id</h4>
                            </div>
                            <div class="p-2 mb-3 bg-info text-dark" >
                                <h5><?= $student['id'] ?></h5>
                            </div>
                        </td>
                        <td>
                            <div class="p-1 mb-0 bg-dark text-white" style="height: 2rem;">
                                <h4>Estudiante</h4>
                            </div>
                            <div class="p-2 mb-3 bg-info text-dark">
                                <h5><?= $student['estudiante']?></h5>
                            </div>
                        </td>
                        <td>
                            <div class="p-1 mb-0 bg-dark text-white" style="height: 2rem;">
                                <h4>Fecha De Nacimiento</h4>
                            </div>
                            <div class="p-2 mb-3 bg-info text-dark">
                                <h5><?= $student['fechaNacimiento']?></h5>
                            </div>
                        </td>
                        <td>
                            <div class="p-1 mb-0 bg-dark text-white" style="height: 2rem;">
                                <h4>Direccion</h4>
                            </div>
                            <div class="p-2 mb-3 bg-info text-dark">
                                <h5><?= $student['direccion']?></h5>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="p-1 mb-0 bg-dark text-white" style="height: 2rem;">
                                <h4>Genero</h4>
                            </div>
                            <div class="p-2 mb-3 bg-info text-dark">
                                <h5><?= $student['genero']?></h5>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>   
    </div>
</div>    