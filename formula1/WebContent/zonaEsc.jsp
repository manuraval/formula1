<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="zonaEscuderia" bundle="${mensajes}" /></title>
<link rel="shortcut icon" href="./Images/formula1.gif" type="image/gif" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./Estilos/zonaJefes.css">
</head>
<body>

	<jsp:include page="cabeceraEsc.jsp" />
	<div class="container">
			<c:set var="aux" value="${0}" />
			<c:set var="lpe" value="${pil.getPilEsc(esc2.nombreEscuderia)}" scope="session" />
			<c:set var="lje" value="${datos.getJefeEsc(esc.nombreEscuderia)}" scope="session" />
			<c:set var="lme" value="${mecanic.getMecEsc(esc3.nombreEscuderia)}" scope="session" />
			
			<h3 align="center">Jefe</h3>
			<div id="tabla">
				<c:if test="${!empty lje}">
					<table class="table">

						<th><fmt:message key="nombre" bundle="${mensajes}" /></th>
						<th><fmt:message key="apellidos" bundle="${mensajes}" /></th>
						<th><fmt:message key="dniJefe" bundle="${mensajes}" /></th>
						<th><fmt:message key="sexo" bundle="${mensajes}" /></th>
						<th>&nbsp;</th>
						
						<%--Recorremos la lista y mostramos los medicos--%>
						<c:forEach items="${lje}" var="j">
							<tr class="table-hover">
								<td><b><c:out value="${j.getNombreJefe()}" /></b></td>
								<td><b><c:out value="${j.getApellidos()}" /></b></td>
								<td><b><c:out value="${j.getDniJefe()}" /></b></td>
								<td><b><c:out value="${j.getSexo()}" /></b></td>
								<td>
									<a href="modificarPiloto.jsp?aux=${aux}" class="glyphicon glyphicon-edit"></a>
									<a href="modificarPiloto.jsp?aux=${aux}" class="glyphicons glyphicons-bin"></a>
								</td>
							</tr>
							<c:set var="aux" value="${aux+1}" />
						</c:forEach>
						</c:if>
					</table>
					<c:if test="${empty lje}">
						<h4 align=center>No se ha encontrado jefes</h4>
					</c:if>
			</div>
			<br>
			<h3 align="center">Pilotos</h3>
			<div id="tabla">
			
				<c:if test="${!empty lpe}">
					<table class="table">

						<th><fmt:message key="nombre" bundle="${mensajes}" /></th>
						<th><fmt:message key="numPiloto" bundle="${mensajes}" /></th>
						<th><fmt:message key="debut" bundle="${mensajes}" /></th>
						<th><fmt:message key="mundiales" bundle="${mensajes}" /></th>
						<th><fmt:message key="sueldo" bundle="${mensajes}" /></th>
						<th><fmt:message key="coche" bundle="${mensajes}" /></th>
						<th><fmt:message key="temporada" bundle="${mensajes}" /></th>
						<th>&nbsp;</th>

						<%--Recorremos la lista y mostramos los medicos--%>
						<c:forEach items="${lpe}" var="p">

							<tr class="table-hover">
								<td><b><c:out value="${p.getNombrePiloto()}" /></b></td>
								<td><b><c:out value="${p.getNumPiloto()}" /></b></td>
								<td><b><c:out value="${p.getDebut()}" /></b></td>
								<td><b><c:out value="${p.getMundiales()}" /></b></td>
								<td><b><c:out value="${p.getSueldo()}" /></b></td>
								<td><b><c:out value="${p.getCoche()}" /></b></td>
								<td><b><c:out value="${p.getTemporada()}" /></b></td>
								<td><a href="modificarPiloto.jsp?aux=${aux}" class="glyphicon glyphicon-pencil">
								<span class="glyphicons glyphicons-pencil"></span></a></td>
							</tr>
							<c:set var="aux" value="${aux+1}" />
						</c:forEach>
						</c:if>
					</table>
					<c:if test="${empty lpe}">
						<h4 align=center>No se ha encontrado pilotos</h4>
					</c:if>
					<a href="nuevoPiloto.jsp" class="col-md-offset-10 btn btn-info btn-sm"><fmt:message key="nuevoPiloto" bundle="${mensajes}" /></a>
			</div>
			<h3 align="center">Mecanicos</h3>
			<div id="tabla">
			
				<c:if test="${!empty lpe}">
					<table class="table">

						<th><fmt:message key="nombre" bundle="${mensajes}" /></th>
						<th><fmt:message key="numPiloto" bundle="${mensajes}" /></th>
						<th><fmt:message key="debut" bundle="${mensajes}" /></th>
						<th><fmt:message key="mundiales" bundle="${mensajes}" /></th>
						<th><fmt:message key="sueldo" bundle="${mensajes}" /></th>
						<th><fmt:message key="coche" bundle="${mensajes}" /></th>
						<th><fmt:message key="temporada" bundle="${mensajes}" /></th>

						<%--Recorremos la lista y mostramos los medicos--%>
						<c:forEach items="${lpe}" var="p">

							<tr class="table-hover">
								<td><b><a href="modificarPiloto.jsp?aux=${aux}"><c:out value="${p.getNombrePiloto()}" /></a></b></td>
								<td><b><c:out value="${p.getNumPiloto()}" /></b></td>
								<td><b><c:out value="${p.getDebut()}" /></b></td>
								<td><b><c:out value="${p.getMundiales()}" /></b></td>
								<td><b><c:out value="${p.getSueldo()}" /></b></td>
								<td><b><c:out value="${p.getCoche()}" /></b></td>
								<td><b><c:out value="${p.getTemporada()}" /></b></td>
							</tr>
							<c:set var="aux" value="${aux+1}" />
						</c:forEach>
						</c:if>
					</table>
					<c:if test="${empty lpe}">
						<h4 align=center>No se ha encontrado mecanicos</h4>
					</c:if>
					<a href="nuevoMecanico.jsp" class="col-md-offset-10 btn btn-info btn-sm"><fmt:message key="nuevoMecanico" bundle="${mensajes}" /></a>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>
