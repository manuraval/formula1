<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="zonaMedico" bundle="${mensajes}" /></title>
<link rel="shortcut icon" href="./img/favicon.png" type="image/png" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./Estilos/zonaJefes.css">

<!-- Custom styles for this template -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


</head>
<body>

	<jsp:include page="cabeceraJefes.jsp" />
	<div class="container">

		<c:set var="lj" value="${datos.getJefe()}" scope="session" />

		<div class="row">
			<%--Contador para pasar como parametro--%>
			<c:set var="aux" value="${0}" />
			<br> <br>
			<div>

				<%--Si el medico es supervisor podra ver todo lo relacionado cnla administracion de los medicos--%>
				<div id="tabla">
					<table class="table table-hover">
						<thead>
							<tr>
								<th><fmt:message key="nombreJefe" bundle="${mensajes}" /></th>
								<th><fmt:message key="apellidosJefe" bundle="${mensajes}"/></th>
								<th><fmt:message key="dniJefe" bundle="${mensajes}" /></th>
							</tr>
						</thead>
						<%--                                     <th><fmt:message key="apellidoMedico" bundle="${mensajes}"/></th> --%>
						<%--                                     <th class="hidden-xs"><fmt:message key="espeMedico" bundle="${mensajes}"/></th> --%>

						<%--Recorremos la lista y mostramos los medicos--%>
						<c:forEach items="${lj}" var="j">
							<tbody>
								<tr <c:if test="${j.sexo=='Hombre'}"> class="info"</c:if>>>
									<td><b><a href="modificarJefe.jsp?aux=${aux}"><c:out value="${j.getNombreJefe()}" /></a></b></td>
									<td><b><c:out value="${j.getApellidos()}" /></b></td>
									<td><b><c:out value="${j.getDniJefe()}" /></b></td>
								</tr>
							</tbody>
							<c:set var="aux" value="${aux+1}" />
						</c:forEach>

					</table>
				</div>
			</div>
			<div class="botones">
				<!--<br><br><br><a href="pacienteNuevo.jsp" class="btn btn-primary btn-sm ">Dar de alta a un paciente</a>-->
				<a href="jefeNuevo.jsp" class="btn btn-info btn-sm"><fmt:message
						key="altaMedico" bundle="${mensajes}" /></a><br>
				<br>
				<br> <a href="consultarEmpleados.jsp"
					class="btn btn-info btn-sm">Consultar Citas</a><br>
				<br>
				<br>

			</div>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>
