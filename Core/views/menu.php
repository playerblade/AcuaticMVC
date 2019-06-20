<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="bg-dark border-dark" id="sidebar-wrapper">
        <div class="list-group list-group-flush" style="width: 13rem;">
            <a href="<?= Route::link("") ?>" class="list-group-item list-group-item-action bg-dark text-light">
                Home
            </a>
            <a href="<?= Route::link("/student") ?>" class="list-group-item list-group-item-action bg-dark text-light">
                Student
            </a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->
    <?php
        include($template); /// THIS VERY IMPORTANT "NO TUCH ME"
    ?>
  </div>

  <script src="../../../AcuaticMVC/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="../../../AcuaticMVC/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>