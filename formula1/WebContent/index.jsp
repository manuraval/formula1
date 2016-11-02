<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setBundle basename="bundles.mensajes" scope="session" var="mensajes"/>

<jsp:useBean id="jefe" class="beans.Jefe" scope="session"/>
<jsp:useBean id="datos" class="beans.Administracion" scope="session"/>
<jsp:useBean id="mecanic" class="beans.Mecanico" scope="session"/>
<jsp:useBean id="piloto" class="beans.Piloto" scope="session"/>


<c:if test="${!empty param['login']}">

    <c:set var="login" value="${medic.identificar(param['login'], param['pass'])}" scope="session"/>

    <c:choose>
        <c:when test="${login}">
            <jsp:forward page="index.jsp"/>
        </c:when>
    </c:choose> 
</c:if>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formula 1</title>
        <link rel="shortcut icon" href="./img/favicon.png" type="image/png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>

            body { 
                background-image: url(./img/inicio.jpg); 

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
                background-color: #F4F4F4;
            }

        </style>

</head>
    <body>
        
        <div class="container">


            <div class="row col-md-offset-5">
                <div class="col-md-5 col-md-offset-0" style="padding-top: 20%">
                    <form method="post" action="zonaMedico.jsp">
                        <div class="form-group">
                            <label for="login"><fmt:message key="nColegiado" bundle="${mensajes}"/></label><br>
                            <input class="form-control" type="text" id="login" name="login" required/><br>
                        </div>
                        <div class="form-group">
                            <label for="pass"><fmt:message key="contra" bundle="${mensajes}"/></label><br>
                            <input class="form-control" type="password" id="pass" name="pass" required/><br>
                        </div>
                            <br>
                        <div class="form-group">
                            <a class="btn btn-info" href="cojerCita.jsp">Pedir Cita</a>
                        </div>
                            <br>
                        <div class="form-group">
                            <input type="submit" class=" btn btn-info" name="entrar"  value="<fmt:message key="IniciarSession" bundle="${mensajes}"/>"/>
                       </div>
                        <c:if test="${!empty param['login']}">
                            <c:if test="${!empty medic.error}">
                                <div class="alert alert-danger alert-dismissable" id="error" >
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>¡Error!</strong> <fmt:message key="error" bundle="${mensajes}"/>   
                                </div>
                            </c:if>
                        </c:if>

                    </form>
                </div>

            </div>

        </div>      


    <script src="./js/jquery-2.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
