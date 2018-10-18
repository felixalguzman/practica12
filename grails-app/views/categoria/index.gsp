<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

</head>

<body>

<div class="dashboard-finance">
    <div class="container-fluid dashboard-content">

        <div class="row">

            <div class="col-xl-12 col-xl-6 col-lg-6 col-md-12 col-md-6 col-sm-12 col-12">
                <div class="card">
                    <h5 class="card-header">Lista de categorias</h5>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">Nombre</th>
                                    <th scope="col" style="text-align: center;">Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${categorias}" var="categoria">
                                    <tr>
                                        <td>${categoria.nombre}</td>

                                        <td align="center">
                                            %{--<button class="btn btn-rounded btn-danger"><i--}%
                                            %{--class="fa fa-minus-square"></i> Eliminar</button>--}%
                                            <button class="btn btn-rounded btn-primary"
                                                    onclick="editar(${categoria.id})"><i
                                                    class="fa fa-pencil-alt"></i> Editar</button>

                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar categoria</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <g:form action="update" controller="categoria"  method="PUT">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Nombre</label>
                        <input id="nombre" type="text" class="form-control" name="nombre" required>
                        <input hidden id="id" name="id">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script>

    function editar(id) {

        let request = new XMLHttpRequest();
        request.open('GET', '/categoria/editar/?id=' + id, true);

        request.onload = function () {
            if (request.status >= 200 && request.status < 400) {
                // Success!
                let resp = JSON.parse(request.responseText);

                // console.log(resp);
                document.getElementById('id').value = resp.id;
                document.getElementById('nombre').value = resp.nombre;

                $('#modal').modal("toggle");


            } else {
                // We reached our target server, but it returned an error

            }
        };

        request.onerror = function () {
            // There was a connection error of some sort
        };

        request.send();

    }

</script>
</body>
</html>