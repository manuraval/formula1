<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setBundle basename="bundles.mensajes" scope="session" var="mensajes"/>

<jsp:useBean id="jefe" class="beans.Jefe" scope="session"/>
<jsp:useBean id="datos" class="beans.Administracion" scope="session"/>
<jsp:useBean id="esc" class="beans.Escuderia" scope="session"/>
<jsp:useBean id="pil" class="beans.Piloto" scope="session"/>
<jsp:useBean id="mecanic" class="beans.Mecanico" scope="session"/>

<!-- Comprobamos que el login y las contraseña son correctos -->
<%-- <c:if test="${!empty param['login']}"> --%>

<%--     <c:set var="login" value="${esc.identificar(param['login'], param['pass'])}" scope="session"/> --%>

<%--     <c:choose> --%>
<%--         <c:when test="${login}"> --%>
<%--             <jsp:forward page="index.jsp"/> --%>
<%--         </c:when> --%>
<%--     </c:choose>  --%>
<%-- </c:if> --%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="shortcut icon" href="./Images/formula1.gif" type="image/igf" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        
        <!-- Hoja de estilos para esta ventana -->
        <link rel="stylesheet" href="./Estilos/index.css">

</head>
    <body>
        
        <div class="container">
            <div class="row col-md-offset-2">
                <div class="col-md-5 col-md-offset-0" style="padding-top: 20%">
                    <form method="post" action="zonaEsc.jsp">
                        <div class="form-group">
                            <label for="login"><fmt:message key="nombreEscuderia" bundle="${mensajes}"/></label><br>
                            <input class="form-control" type="text" id="login" name="login" required/><br>
                        </div>
                        <div class="form-group">
                            <label for="pass"><fmt:message key="contra" bundle="${mensajes}"/></label><br>
                            <input class="form-control" type="password" id="pass" name="pass" required/><br>
                            <a href="#" id="passOl">¿Ha olvidado su contraseña?</a>
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" class=" btn btn-info" name="entrar"  value="<fmt:message key="IniciarSession" bundle="${mensajes}"/>"/>
                            <input type="button" class=" btn btn-warning" name="registrar"  value="<fmt:message key="Registrar" bundle="${mensajes}"/>"/>
                       </div>
<%--                         <c:if test="${!empty param['login']}"> --%>
<%--                             <c:if test="${!empty esc.error}"> --%>
<!--                                 <div class="alert alert-danger alert-dismissable" id="error" > -->
<!--                                     <button type="button" class="close" data-dismiss="alert">&times;</button> -->
<%--                                     <strong>¡Error!</strong> <fmt:message key="error" bundle="${mensajes}"/>    --%>
<!--                                 </div> -->
<%--                             </c:if> --%>
<%--                         </c:if> --%>
					<c:if test="${!empty esc.error}">
						<div class="alert alert-danger alert-dismissable" id="error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>¡Error!</strong>
							<fmt:message key="error" bundle="${mensajes}" />
						</div>
					</c:if>
				</form>
                </div>
            </div>
        </div>      

    <script src="./js/jquery-2.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>