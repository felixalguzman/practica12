<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Usuario nuevo</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

</head>

<body>

<div class="dashboard-finance">
    <div class="container-fluid dashboard-content">

        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="section-block" id="basicform">
                    <h3 class="section-title"><g:message code="registrar.contacto"/></h3>
                </div>

                <div class="card">
                    <h5 class="card-header"><g:message code="informacion"/></h5>

                    <form id="form"  method="post">
                        <div class="card-body">

                            <div class="form-group">
                                <label for="nombre" class="col-form-label"><g:message code="nombre"/></label>
                                <input id="nombre" type="text" class="form-control" name="nombre" required>
                            </div>

                            <div class="form-group">
                                <label for="apellido" class="col-form-label"><g:message code="apellido"/></label>
                                <input id="apellido" type="text" class="form-control" name="apellido" required>
                            </div>

                            <div class="form-group">
                                <label for="telefono" class="col-form-label"><g:message code="telefono"/></label>
                                <input id="telefono" type="text" class="form-control telefono" name="telefono">
                            </div>

                            <div class="form-group">
                                <label for="movil" class="col-form-label"><g:message code="movil"/></label>
                                <input id="movil" type="tel" class="form-control telefono" name="movil" required>
                            </div>

                            <div class="form-group">
                                <label for="puesto" class="col-form-label"><g:message code="puesto"/></label>
                                <input id="puesto" type="text" class="form-control" name="puesto" required>
                            </div>

                            <div class="form-group">
                                <label for="direccion" class="col-form-label"><g:message code="direccion"/></label>
                                <input id="direccion" type="text" class="form-control" name="direccion" required>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail"><g:message code="correo"/></label>
                                <input id="inputEmail" type="email" placeholder="name@example.com" name="email"
                                       class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="categoria"><g:message code="categoria"/></label>
                                <select id="categoria" name="categoria">
                                    <option value="${null}" selected><g:message code="seleccione"/></option>
                                    <g:each in="${categorias}" var="categoria">
                                        <option value="${categoria.id}">${categoria.nombre}</option>

                                    </g:each>

                                </select>

                            </div>

                            <div class="form-group">
                                <label for="departamentos"><g:message code="departamento"/></label>
                                <select name="departamentos" multiple="multiple" id="departamentos" style="width: 100%">

                                </select>

                            </div>

                            <input hidden name="usuario" value="${usuario.id}">

                        </div>

                    %{--<div class="card-body border-top">--}%
                    %{--<h3>Información de usuario</h3>--}%


                    %{--<label for="usuario" class="col-form-label">Usuario</label>--}%

                    %{--<div class="form-group">--}%
                    %{--<div class="input-group mb-3"><span class="input-group-prepend"><span--}%
                    %{--class="input-group-text">@</span></span>--}%
                    %{--<input type="text" id="usuario" placeholder="Nombre de usuario" name="username"--}%
                    %{--class="form-control" required>--}%
                    %{--</div>--}%
                    %{--</div>--}%

                    %{--<label for="password">Contraseña</label>--}%

                    %{--<div class="form-group">--}%
                    %{--<div class="input-group mb-3"><span class="input-group-prepend"><span--}%
                    %{--class="input-group-text"><i class="fa fa-key"></i></span></span>--}%
                    %{--<input type="password" id="password" placeholder="Contraseña" name="password"--}%
                    %{--class="form-control" required>--}%
                    %{--</div>--}%
                    %{--</div>--}%


                    %{--</div>--}%

                        <div style="float: right;margin-bottom: 5px;margin-right: 15px">
                            <button type="reset" class="btn btn-brand"><g:message code="cancelar"/></button>
                            <button type="submit" class="btn btn-success">OK</button>
                            <br>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"> <g:message code="error"/> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <g:form controller="contacto" action="existe">
                <div class="modal-body">
                    <label id="errores"></label>
                    <div class="form-group">
                        <div class="form-group">
                            <label for="departamentosR"><g:message code="departamento"/></label>
                            <select name="departamentos" multiple="multiple" id="departamentosR" style="width: 100%">

                            </select>

                        </div>
                        <input hidden type="text" id="error" name="error">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"> <g:message code="cerrar"/> </button>
                    <button type="submit" class="btn btn-primary"> <g:message code="guardar"/> </button>
                </div>
            </g:form>
        </div>
    </div>
</div>


<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
<script>

    $(document).ready(function () {

        $(".telefono").inputmask({"mask": "(999) 999-9999"});

        $('#departamentos').select2({
            width: 'resolve',
            placeholder: '<g:message code="departamentos" /> ',
            allowClear: true,
            // templateResult: format,
            // selectionAdapter: 'SingleSelection',
            // templateSelection: format,
            ajax: {
                url: "/departamento/todos",
                processResults: function (data) {
                    data = data.map(function (departamento) {
                        return {
                            id: departamento.id,
                            text: departamento.nombre,
                            // otherfield: item.otherfield
                        };
                    });
                    return {results: data};
                },
            },
        });

        $("#form").on("submit", function (e) {
            // alert('entro');
            e.preventDefault();
            crear();
        })


    });

    function crear() {

        $.ajax({
            type: 'POST',
            data: $('#form').serialize(),
            url: "${g.createLink(controller:'contacto',action:'save')}",
            success: function (res) {

                // alert('se fue');
                if (res.valido !== 1){
                    alert('error');
                    console.log(res.errores.map(a => a.arguments[0] + ": " + a.arguments[2]));
                    mostrarErrores(res.errores.map(a => a.arguments[0] +": " + a.arguments[2]));

                }
                else {

                    alert('guardado');
                }
            }


        })
    }

    function mostrarErrores(errores) {

        document.getElementById("errores").textContent = "Existe un contacto con los campos: " + errores;
        document.getElementById("error").value = errores;


        $('#departamentosR').select2({
            width: 'resolve',
            placeholder: '<g:message code="departamentos" /> ',
            allowClear: true,
            // templateResult: format,
            // selectionAdapter: 'SingleSelection',
            // templateSelection: format,
            ajax: {
                url: "/departamento/todos",
                processResults: function (data) {
                    data = data.map(function (departamento) {
                        return {
                            id: departamento.id,
                            text: departamento.nombre,
                            // otherfield: item.otherfield
                        };
                    });
                    return {results: data};
                },
            },
        });
        console.log( 'data: ' +$('#departamentos').val());
        $('#departamentosR').val([$('#departamentos').val()]);
        $("#modal").modal("toggle");


    }



</script>

</body>
</html>
