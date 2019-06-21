<div class="container">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido Paterno</th>
      <th>Opciones</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $instructor) {?>
    <tr>
        <td>
            <?= $instructor['id'] ?>
        </td>
        <td>
            <?= $instructor['primerNombre'] ?>
        </td>
        <td>
            <?= $instructor['apellidoPaterno'] ?>
        </td>
        <td>
            [show]
            [edit]
            [delete]
        </td>
    </tr>
    <?php } ?>
  </tbody>
</table>