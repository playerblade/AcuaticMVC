<div class="container">
    <div class="card-body">
        <div class="card-header">
            <h2>
                Detalles del estudiante
                <a href="<?= Route::link("/student/{$student['id']}/edit")?>" class="btn btn-primary btn-lg">
                    &#9998
                </a>
            </h2>
        </div>
        
        <div class="card-header">
            <div class="card-body">
                <div class="p-1 mb-0 bg-dark text-white">
                    <h4>ID</h4>
                </div>
                <div class="p-2 mb-3 bg-light text-dark">
                    <h5><?= $student['id'] ?></h5>
                </div>

                <div class="p-1 mb-0 bg-dark text-white">
                    <h5>Primer Nombre</h5><!--Nombre Completo-->
                </div>
                <div class="p-2 mb-3 bg-light text-dark">
                    <h6><?= $student['primerNombre']?></h6>
                </div>  
            </div>   
        </div>   
    </div>
</div>    