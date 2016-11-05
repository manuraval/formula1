<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setBundle basename="bundles.mensajes" scope="session" var="mensajes"/>

<jsp:useBean id="jef" class="beans.Jefe" scope="session"/>
<jsp:useBean id="datos" class="beans.Administracion" scope="session"/>
<jsp:useBean id="pil" class="beans.Piloto" scope="session"/>



<!-- Comprobamos que el login y las contraseña son correctos -->
<c:if test="${!empty param['login']}">

    <c:set var="login" value="${jef.identificar(param['login'], param['pass'])}" scope="session"/>

    <c:choose>
        <c:when test="${login}">
            <jsp:forward page="index.jsp"/>
        </c:when>
    </c:choose> 
</c:if>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="shortcut icon" href="./img/favicon.png" type="image/png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="./Estilos/index.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>
    <body>
        
        <div class="container">


            <div class="row col-md-offset-5">
                <div class="col-md-5 col-md-offset-0" style="padding-top: 20%">
                    <form method="post" action="zonaJefes.jsp">
                        <div class="form-group">
                            <label for="login"><fmt:message key="dniJefe" bundle="${mensajes}"/></label><br>
                            <input class="form-control" type="text" id="login" name="login" required/><br>
                        </div>
                        <div class="form-group">
                            <label for="pass"><fmt:message key="contra" bundle="${mensajes}"/></label><br>
                            <input class="form-control" type="password" id="pass" name="pass" required/><br>
                        </div>
                        <div class="form-group">
                            <input type="submit" class=" btn btn-info" name="entrar"  value="<fmt:message key="IniciarSession" bundle="${mensajes}"/>"/>
                       </div>
                        <c:if test="${!empty param['login']}">
                            <c:if test="${!empty jef.error}">
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