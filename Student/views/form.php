<h2>Form Student</h2>
<form action="<?= $action ?>" method="post">
    Primer Nombre:
    <br>
    <input type="text" name="primerNombre" value="<?= $student['primerNombre'] ?? "" ?>"/>
    <br>

    <input type="submit" value="Guardar"/>
</form>