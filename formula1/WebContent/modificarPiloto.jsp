<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="pil" class="beans.Piloto" scope="session"/>

<c:if test="${param.modificar != null}">
    <jsp:setProperty property="nombrePiloto" name="pil"/>
    <jsp:setProperty property="numPiloto" name="pil"/>
    <jsp:setProperty property="temporada" name="pil"/>
</c:if>

<c:if test="${!empty param['numPiloto']}">

    <c:set var="pil" value="${datos.modificarPiloto(param['nColegiado'],param['nombre'], param['apellidos'], param['especialidad'],
                                param['sexo'], param['password'])}" scope="page"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="./img/favicon.png" type="image/png" />
        <title><fmt:message key="modiPerfil" bundle="${mensajes}"/></title>
        <link rel="shortcut icon" href="./img/favicon.png" type="image/png" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/zonaJefes.css">
        
        <style>
            
               body{
                background-image: url(Images/modificarPil.jpg); 
                color: black;
                background-position: center center;

                /* La imagen de fondo no se repite */
                background-repeat: no-repeat;

                /* La imagen de fondo está fija en el viewport, de modo que no se mueva cuando
                   la altura del contenido supere la altura de la imagen. */
                background-attachment: fixed;

                /* La imagen de fondo se reescala cuando se cambia el ancho de ventana
                   del navegador */
                background-size: cover;

                /* Fijamos un color de fondo para que se muestre mientras se está
                  cargando la imagen de fondo o si hay problemas para cargarla  */
                background-color: #F4F4F4;

            } 
            #formu{
                padding: 2%;
                background-image: url(Images/black30.png);
                color: white;
                background-position: center center;

                /* La imagen de fondo no se repite */
                background-repeat: no-repeat;

                /* La imagen de fondo está fija en el viewport, de modo que no se mueva cuando
                   la altura del contenido supere la altura de la imagen. */
                background-attachment: fixed;

                /* La imagen de fondo se reescala cuando se cambia el ancho de ventana
                   del navegador */
                background-size: cover;

                /* Fijamos un color de fondo para que se muestre mientras se está
                  cargando la imagen de fondo o si hay problemas para cargarla  */

            }

            .error{
                color: red;
            }

            
        </style>


        <!-- Custom styles for this template -->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
      
        <script src="./js/jquery-2.2.1.min.js"></script>
        <script src="dist/jquery.validate.min.js"></script>
        <script src="dist/additional-methods.min.js"></script>

        <script type="text/javascript" >

            $(function () {

                $("#mod").on("click", function () {

                    $.validator.addMethod("metodonombre", function (value, element) {
                        return this.optional(element) || /^[a-zA-Z," "]+$/i.test(value);
                    }, "No se Permitan numeros");

                    $.validator.addMethod("metodonumerocolegiado", function (value, element) {
                        return this.optional(element) || /^[0-9]{2}\/[0-9]{2}\/[0-9]{5}$/g.test(value);
                    }, "El formato es 00/00/00000");

                    $("#formulario").validate({
                        // Reglas
                        rules: {
                            nColegiado: {required: true, metodonumerocolegiado: true},
                            nombre: {required: true, metodonombre: true, maxlength: 20},
                            apellidos: {required: true, metodonombre: true, maxlength: 25},
                            especialidad: {required: true, metodonombre: true, maxlength: 25},
                            password: {required: true, maxlength: 15}

                        },
                        messages: {
                            //Mensajes 
                            nColegiado: {required: 'El campo es obligatorio', errorClass: "error"},
                            nombre: {required: 'El campo es obligatorio', errorClass: "error"},
                            apellidos: {required: 'El campo es obligatorio', errorClass: "error"},
                            especialidad: {required: 'El campo es obligatorio', errorClass: "error", },
                            password: {required: 'el campo es obligatorio', errorClass: "error"}
                        }



                    });
                });
            });
        </script>

    </head>
    <body>

        <jsp:include page="cabeceraEsc.jsp"/>          

        <div class="container">
            <hr>
            <div class="row">
                <div class="col-md-offset-0">
                    <div id="formu" class="img-rounded">

                        <form method="post" id="formulario" action="modificarPiloto.jsp" >
                            <div class="form-group">
                                <label for="numPiloto"><fmt:message key="numPiloto" bundle="${mensajes}"/></label>
                                <input style="text-align: center;" class="form-control" type="text" id="numPiloto" name="numPiloto" readonly value="${pil.numPiloto}" required/><br>
                            </div>
                            <div class="form-group">
                                <label for="nombre"><fmt:message key="nombre" bundle="${mensajes}"/></label>
                                <input style="text-align: center;" class="form-control" type="text" id="nombre" name="nombre" required value="${pil.nombrePiloto}" /><br>
                            </div>
                            <div class="form-group">
                                <label for="debut"><fmt:message key="debut" bundle="${mensajes}"/></label>
                                <input style="text-align: center;" class="form-control" type="text" id="debut" name="debut" required value="${pil.debut}" /><br>
                            </div>
                            <div class="form-group">
                                <label for="mundiales"><fmt:message key="mundiales" bundle="${mensajes}"/></label>
                                <input style="text-align: center;" class="form-control" type="text" id="mundiales" name="mundiales" required value="${pil.mundiales}" /><br>
                            </div>
                            <div class="form-group">
                                <label for="sueldo"><fmt:message key="sueldo" bundle="${mensajes}"/></label>
                                <input style="text-align: center;" class="form-control" type="text" id="sueldo" name="sueldo" required value="${pil.sueldo}" /><br>
                            </div>
                            <div class="form-group">
                                <label for="temporada"><fmt:message key="temporada" bundle="${mensajes}"/></label>
                                <input style="text-align: center;" class="form-control" type="text" id="temporada" name="temporada" required value="${pil.temporada}" /><br>
                            </div>
                            
                            <br>
                            <div class="form-group">
                                <input type="submit" class=" btn btn-info" id="mod" name="modificar"  value="<fmt:message key="modificar" bundle="${mensajes}"/>"/>
                                <a href="zonaEsc.jsp" id="registrar" class="btn btn-warning col-md-offset-1"><fmt:message key="atras" bundle="${mensajes}"/></a>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </body>
</html>