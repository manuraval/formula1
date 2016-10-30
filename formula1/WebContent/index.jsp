<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- <%@ taglib uri="http://java.sun.com/jsp/jslt/core" prefix="c" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jslt/fmt" prefix="fmt" %> --%>

<fmt:setBundle basename="bundles.mensajes" scope="session" var="mensajes" />

<jsp:useBean id="jefes" class="beans.Jefe" scope="session" />
<jsp:useBean id="mecanicos" class="beans.Mecanico" scope="session" />
<jsp:useBean id="pilotos" class="beans.Piloto" scope="session" />
<jsp:useBean id="escuderia" class="beans.Escuderia" scope="session" />
<jsp:useBean id="datos" class="beans.Administracion" scope="session" />

<!-- Comprobamos que el login y las contraseña son correctos -->
<c:if test="${!empty param['login']}">

	<c:set var="login" value="${jefes.identificar(param['login'], param['pass'])}" scope="session" />

	<c:if test="${!empty jefes.error}">
		<div class="alert alert-danger alert-dismissable" id="error">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>¡Error!</strong>
			<fmt:message key="error" bundle="${mensajes}" />
	</c:if>
	<c:choose>
		<c:when test="${login}">
			<jsp:forward page="zonaJefes.jsp" />
		</c:when>
	</c:choose>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./Estilos/index.css">
<link rel="shortcut icon" href="./Images/formula1.gif" type="image/gif" />
<title>Iniciar Sesion</title>

</head>
<body>
	<div class="container">
		<div class="row col-md-offset-4">
			<div class="col-md-5 col-md-offset-0" style="padding-top: 15%;">
				<form method="post" action="zonaJefes.jsp">
					<input class="img-circle img-responsive" type="image"
						src="Images/formula1.gif" accept=""
						alt="Sin imagen" width="50%"/> <br>
					<div class="form-group">
						<label for="login">Dni jefe:</label> <br> <input class="form-control"
							type="text" id="login" name="login" /> <br>
					</div>
					<div class="form-group">
						<label for="pass">Contraseña:</label> <br> <input class="form-control"
							type="password" id="pass" name="pass" /> <br>
					</div>
					<div class="form-group">
						<input type="submit" class=" btn btn-info" name="entrar"
							value="Iniciar sesion" />
					</div>
					<div class="form-group">
						<a class="btn btn-info" href="zonaPaciente.jsp">Inicio
							Empleados</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="./js/jquery-2.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>