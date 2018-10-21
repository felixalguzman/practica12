<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Departamento nuevo</title>
    </head>
    <body>

    <div class="dashboard-finance">
        <div class="container-fluid dashboard-content">

            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section-block" id="basicform">
                        <h3 class="section-title">Registrar nueva categoría</h3>
                    </div>

                    <div class="card">
                        <h5 class="card-header">Departamento</h5>

                        <g:form action="save" controller="departamento" method="POST">
                            <div class="card-body">

                                <div class="form-group">
                                    <label for="nombre" class="col-form-label">Nombre</label>
                                    <input id="nombre" type="text" class="form-control" name="nombre" required>
                                </div>


                                <div style="float: right;margin-bottom: 5px;margin-right: 15px">
                                    <button type="reset" class="btn btn-brand">Cancelar</button>
                                    <button type="submit" class="btn btn-success">OK</button>
                                    <br>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </body>
</html>
