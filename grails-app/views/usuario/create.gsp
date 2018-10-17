<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Usuario nuevo</title>
</head>

<body>

<div class="dashboard-finance">
    <div class="container-fluid dashboard-content">

        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="section-block" id="basicform">
                    <h3 class="section-title">Registrar nuevo usuario</h3>
                </div>

                <div class="card">
                    <h5 class="card-header">Información básica</h5>

                    <g:form action="save" controller="usuario" method="POST">
                        <div class="card-body">

                            <div class="form-group">
                                <label for="nombre" class="col-form-label">Nombre</label>
                                <input id="nombre" type="text" class="form-control" name="nombre" required>
                            </div>

                            <div class="form-group">
                                <label for="apellido" class="col-form-label">Apellido</label>
                                <input id="apellido" type="text" class="form-control" name="apellido" required>
                            </div>

                            <div class="form-group">
                                <label for="telefono" class="col-form-label">Teléfono</label>
                                <input id="telefono" type="text" class="form-control telefono" name="telefono">
                            </div>

                            <div class="form-group">
                                <label for="movil" class="col-form-label">Movil</label>
                                <input id="movil" type="tel" class="form-control telefono" name="movil" required>
                            </div>

                            <div class="form-group">
                                <label for="puesto" class="col-form-label">Puesto</label>
                                <input id="puesto" type="text" class="form-control" name="puesto" required>
                            </div>

                            <div class="form-group">
                                <label for="direccion" class="col-form-label">Dirección</label>
                                <input id="direccion" type="text" class="form-control" name="direccion" required>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail">Correo</label>
                                <input id="inputEmail" type="email" placeholder="name@example.com" name="email"
                                       class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="categoria">Categoría</label>
                                <g:select name="categoria"  noSelection="${['null':'Seleccione']}" from="${categorias}" optionValue="nombre" optionKey="id"  />

                            </div>

                        </div>

                        <div class="card-body border-top">
                            <h3>Información de usuario</h3>


                            <label for="usuario" class="col-form-label">Usuario</label>

                            <div class="form-group">
                                <div class="input-group mb-3"><span class="input-group-prepend"><span
                                        class="input-group-text">@</span></span>
                                    <input type="text" id="usuario" placeholder="Nombre de usuario" name="username"
                                           class="form-control" required>
                                </div>
                            </div>

                            <label for="password">Contraseña</label>

                            <div class="form-group">
                                <div class="input-group mb-3"><span class="input-group-prepend"><span
                                        class="input-group-text"><i class="fa fa-key"></i></span></span>
                                    <input type="password" id="password" placeholder="Contraseña" name="password"
                                           class="form-control" required>
                                </div>
                            </div>


                        </div>

                        <div style="float: right;margin-bottom: 5px;margin-right: 15px">
                            <button type="reset" class="btn btn-brand">Cancelar</button>
                            <button type="submit" class="btn btn-success">OK</button>
                            <br>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
<script>

    $(document).ready(function () {

        $(".telefono").inputmask({"mask": "(999) 999-9999"});
    });


</script>

</body>
</html>
