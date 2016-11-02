<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="zonaMedico" bundle="${mensajes}" /></title>
<link rel="shortcut icon" href="./img/favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/zonaMedico.css">

<!-- Custom styles for this template -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<link rel="stylesheet" href="./css/zonaMedico.css">

<style>
body {
	background-image: url(img/medicoZ.jpg);
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

a {
	color: black;
	cursor: pointer;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

h1 {
	font-size: 100px;
	color: black;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	height: 60px;
}
</style>

</head>
<body>

	<jsp:include page="cabeceraJefes.jsp" />
	<div class="container">

		<c:set var="lm" value="${datos.getMedicos()}" scope="session" />

		<div class="row">
			<%--Contador para pasar como parametro--%>
			<c:set var="aux" value="${0}" />
			<br> <br>
			<div>

				<%--Si el medico es supervisor podra ver todo lo relacionado cnla administracion de los medicos--%>
				<c:if test="${medic.supervisor == 1}">
					<div id="tabla">
						<table class="table">
							<th><fmt:message key="nombreMedico" bundle="${mensajes}" /></th>
							<th><fmt:message key="nColegiado" bundle="${mensajes}" /></th>
							<th><fmt:message key="apellidoMedico" bundle="${mensajes}" /></th>
							<th class="hidden-xs"><fmt:message key="espeMedico"
									bundle="${mensajes}" /></th>

							<%--Recorremos la lista y mostramos los medicos--%>
							<c:forEach items="${lm}" var="m">

								<tr <c:if test="${m.supervisor==1}"> class="warning"</c:if>>
									<td><b><a href="modificarMedicoAdmin.jsp?aux=${aux}"><c:out
													value="${m.getNombre()}" /></a></b></td>
									<td><b><c:out value="${m.getNumColegiado()}" /></b></td>
									<td><b><c:out value="${m.getApellidos()}" /></b></td>
									<td class="hidden-xs"><b><c:out
												value="${m.getEspecialidad()}" /></b></td>
								</tr>
								<c:set var="aux" value="${aux+1}" />
							</c:forEach>

						</table>
					</div>
			</div>
			<div class="botones">
				<br><br><br><a href="pacienteNuevo.jsp" class="btn btn-primary btn-sm ">Dar de alta a un paciente</a>
				<a href="medicoNuevo.jsp" class="btn btn-info btn-sm"><fmt:message
						key="altaMedico" bundle="${mensajes}" /></a><br> <br> <br>
				<a href="consultarCitas.jsp" class="btn btn-info btn-sm">Consultar
					Citas</a><br> <br> <br>
				</c:if>
				<%-- Si el medico no es supervisor vera directamente las consultas --%>

				<c:if test="${medic.supervisor == 0}">
					<%-- 					<jsp:include page="consultarCitas.jsp" /> --%>
				</c:if>

			</div>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>
