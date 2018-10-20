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
                    <h5 class="card-header">Lista de contactos</h5>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">Nombre</th>
                                    %{--<th scope="col">Usuario</th>--}%
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Movil</th>
                                    <th scope="col">Puesto</th>
                                    <th scope="col">Categorias</th>
                                    <th scope="col">Correo</th>
                                    <th scope="col" style="text-align: center;">Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${usuarios}" var="usuario">
                                    <tr>
                                        <td>${usuario.nombre} ${usuario.apellido}</td>
                                        %{--<td>${contacto.username}</td>--}%
                                        <td>${usuario.telefono}</td>
                                        <td>${usuario.movil}</td>
                                        <td>${usuario.puesto}</td>
                                        <td>${usuario.email}</td>
                                        <td>

                                            <g:each in="${usuario.categorias}" var="categoria">
                                                <span class="badge badge-pill badge-info">${categoria.nombre}</span>
                                            </g:each>

                                        </td>

                                        <td align="center">
                                            <button class="btn btn-rounded btn-danger"><i
                                                    class="fa fa-minus-square"></i> Eliminar</button>
                                            <button class="btn btn-rounded btn-primary"><i
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
</body>
</html>