<div class="container">
    <div class="panel-group">
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
            <label for="id">Id:</label>
            <?= $student['id'] ?>
            <br>
            <label for="primerNombre">Primer Nombre:</label>
            <?= $student['primerNombre']?>
            
        </div>   
    </div>
    </div>
</div>
<div class="container">
  <h2>Panels with Contextual Classes</h2>
  <div class="panel-group">
<div class="panel panel-primary">
      <div class="panel-heading">Panel with panel-primary class</div>
      <div class="panel-body">Panel Content</div>
    </div>
</div>
</div>    