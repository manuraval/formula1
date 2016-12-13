<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${!empty esc.nombreEscuderia}">

	<c:set var="pilotn"
		value="${datos.nuevoPiloto(param['numPiloto'],param['nombre'], param['sueldo'], param['debut'],
                                 param['mundiales'], esc.nombreEscuderia , param['temporada'])}"
		scope="page" />

	<c:if test="${pilotn == false}">
		<div class="alert alert-danger alert-dismissable text-center"
			id="error">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>¡Error!</strong>
			<fmt:message key="errorN" bundle="${mensajes}" />
		</div>

	</c:if>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./Images/piloto.png" type="image/png" />
<title><fmt:message key="nuevoPiloto" bundle="${mensajes}" /></title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./Estilos/nuevoPiloto.css">

<!-- JavaScripts para esta ventana -->
<script src="./js/jquery-2.2.1.min.js"></script>
<script src="./dist/jquery.validate.min.js"></script>
<script src="./dist/additional-methods.min.js"></script>
<script src="./js/nuevoPiloto.js"></script>

</head>
<body>

	<jsp:include page="cabeceraEsc.jsp" />

	<div class="container">
		<hr>
		<div class="row">
			<div class="col-md-offset-0">
				<div id="formu" class="img-rounded">
					<form method="post" id="formulario" action="nuevoPiloto.jsp">
						<div class="form-group">
							<label for="numPiloto"><fmt:message key="numPiloto" bundle="${mensajes}" /></label> <input style="text-align: center;"
								class="form-control" type="text" id="numPiloto" name="numPiloto" required placeholder="Nº de Piloto"/><br>
						</div>
						<div class="form-group">
							<label for="nombre"><fmt:message key="nombre" bundle="${mensajes}" /></label> <input style="text-align: center;"
								class="form-control" type="text" id="nombre" name="nombre" required placeholder="Nombre del piloto"/><br>
						</div>
						<div class="form-group">
							<label for="sueldo"><fmt:message key="sueldo" bundle="${mensajes}" /></label> <input style="text-align: center;"
								class="form-control" type="text" id="sueldo" name="sueldo" required placeholder="Sueldo del piloto"/><br>
						</div>
						<div class="form-group">
							<label for="debut"><fmt:message key="debut" bundle="${mensajes}" /></label> <input style="text-align: center;"
								class="form-control" type="text" id="debut" name="debut" required placeholder="Año del debut del piloto"/><br>
						</div>
						<div class="form-group">
							<label for="mundiales"><fmt:message key="mundiales" bundle="${mensajes}" /></label> <input style="text-align: center;"
								class="form-control" type="number" id="mundiales" name="mundiales" required placeholder="Nª de mundiales del piloto"/><br>
						</div>
						<div class="form-group">
							<label for="temporada"><fmt:message key="temporada" bundle="${mensajes}" /></label> <input style="text-align: center;"
								class="form-control" type="text" id="temporada" name="temporada" required placeholder="Temporada del piloto"/><br>
						</div>
						<br>
						<div class="form-group">
							<input type="submit" class="btn btn-info" id="mod" name="registrar" value="<fmt:message key="registrarPiloto" bundle="${mensajes}"/>" />
							<input class="col-md-1 col-md-offset-1 btn btn-warning btn-sm" type="button" value="Volver" name="Back2" onclick="history.back()"/>
						</div>
					</form>
				</div>
			</div>
			<br>
		</div>
	</div>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
