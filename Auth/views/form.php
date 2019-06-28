<div class="container mt-md-5">
    <div class="row justify-content-md-center">
        <div class="table" style="width: 50rem;">
<!--            <div class="card">-->
                <div class="card-header text-light">
                    <h2>Login</h2>
                </div>
<!--            </div>-->
            <div class="card-header">
                <table width="80%"  style="margin: 0 auto;">
                    <div class="card-body">
                        <tr>
                            <th>
                                <form action="<?= Route::link('/login')?>" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"  >Email address</label>
                                        <input type="text" class="form-control" name="usuario" placeholder="Enter User" required>
                                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="text" class="form-control" name="contrasenia" placeholder="Password" required>
                                    </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input">
                                        <label class="form-check-label" >Check me out</label>
                                    </div>
                                    <button type="submit" class="btn btn-info">Accept</button>
                                </form>

                                <br>
                            </th>
                        </tr>
                    </div>
                </table>
            </div>
        </div>
    </div>
</div>
