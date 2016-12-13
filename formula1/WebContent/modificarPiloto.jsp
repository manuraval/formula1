<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="pil" class="beans.Piloto" scope="session"/>

<c:if test="${param.modificar != null}">
    <jsp:setProperty property="nombrePiloto" name="pil"/>
    <jsp:setProperty property="numPiloto" name="pil"/>
    <jsp:setProperty property="temporada" name="pil"/>
</c:if>

<c:if test="${!empty pil.numPiloto}">

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
        
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        
        <!-- Hoja de estilos para esta ventana -->
        <link rel="stylesheet" href="./Estilos/zonaJefes.css">
        <link rel="stylesheet" href="./Estilos/modificarPiloto.css">
      
   		<!-- JavaScripts para esta ventana -->   
        <script src="./js/jquery-2.2.1.min.js"></script>
        <script src="dist/jquery.validate.min.js"></script>
        <script src="dist/additional-methods.min.js"></script>
        <script src="./js/modificarPiloto.js"></script>

    </head>
    <body>
		<!-- Cabecera de la pagina, donde se vera el menu de inicio -->
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
                                <input class="col-md-1 col-md-offset-1 btn btn-warning btn-sm" type="button" value="Volver" name="Back2" onclick="history.back()"/>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </body>
</html>