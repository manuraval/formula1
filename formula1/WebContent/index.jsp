<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="fmt" uri="http://java.sun/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setBundle basename="bundles.mensajes" scope="session"
	var="mensajes" />

<jsp:useBean id="jefes" class="beans.Jefe" scope="session" />
<jsp:useBean id="mecanicos" class="beans.Mecanico" scope="session" />
<jsp:useBean id="pilotos" class="beans.Piloto" scope="session" />
<jsp:useBean id="escuderia" class="beans.Escuderia" scope="session" />
<jsp:useBean id="datos" class="beans.Administracion" scope="session" />


<c:if test="${!empty param['login']}">

</c:if>

<%-- Comprobamos que el login y las contraseña son correctos --%>
<c:if test="${!empty param['login']}">

	<c:set var="login"
		value="${jefes.identificar(param['login'], param['pass'])}"
		scope="session" />

	<c:if test="${!empty jefes.error}">
		<div class="alert alert-danger alert-dismissable" id="error">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>¡Error!</strong>
			<fmt:message key="error" bundle="${mensajes}" />
		</div>
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
<title><fmt:message key="IniciarSession" bundle="${mensajes}" /></title>
</head>
<body>
	<div class="container">
		<div class="row col-md-offset-4">
			<div class="col-md-5 col-md-offset-0" style="padding-top: 15%;">
				<form method="post" action="zonaJefes.jsp">
					<input class="img-circle img-responsive" type="image"
						src="Images/formula1.gif"
						title="<fmt:message key="pulse" bundle="${mensajes}"/>" accept=""
						alt="Sin imagen" width="50%"> <br>
					<div class="form-group">
						<label for="login"><fmt:message key="dniJefe"
								bundle="${mensajes}" /></label> <br> <input class="form-control"
							type="text" id="login" name="login" required /> <br>
					</div>
					<div class="form-group">
						<label for="pass"><fmt:message key="contra"
								bundle="${mensajes}" /></label> <br> <input class="form-control"
							type="password" id="pass" name="pass" required /> <br>
					</div>
					<div class="form-group">
						<a class="btn btn-info" href="zonaPaciente.jsp">Inicio
							Empleados</a>
					</div>
					<br>
					<div class="form-group">
						<input type="submit" class=" btn btn-info" name="entrar"
							value="<fmt:message key="IniciarSession" bundle="${mensajes}"/>" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="./js/jquery-2.2.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>