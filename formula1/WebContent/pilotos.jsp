<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="esc" class="beans.Escuderia" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="pilotos" bundle="${mensajes}" /></title>
<link rel="shortcut icon" href="./Images/formula1.gif" type="image/gif" />

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Hoja de estilos para esta ventana -->
<link rel="stylesheet" href="./Estilos/zonaJefes.css">
</head>

<body>
	<div class="container">
		<br> <img class="img-rounded" alt=""
			src="Images/encabezadoPil.jpg" width="100%" height="250px">
		<c:set var="aux" value="${0}" />
		<c:set var="lpe" value="${pil.getPilEsc(esc.nombreEscuderia)}"
			scope="session" />
		<h2 align="center">Pilotos</h2>
		<div id="tabla">

			<c:if test="${!empty lpe}">
				<table class="table">

					<th><fmt:message key="nombre" bundle="${mensajes}" /></th>
					<th><fmt:message key="numPiloto" bundle="${mensajes}" /></th>
					<th><fmt:message key="debut" bundle="${mensajes}" /></th>
					<th><fmt:message key="mundiales" bundle="${mensajes}" /></th>
					<th><fmt:message key="sueldo" bundle="${mensajes}" /></th>
					<th><fmt:message key="temporada" bundle="${mensajes}" /></th>
					<th>&nbsp;</th>

					<!-- 						Recorremos la lista y mostramos los medicos -->
					<c:forEach items="${lpe}" var="p">

						<tr class="table-hover">
							<td><b><c:out value="${p.getNombrePiloto()}" /></b></td>
							<td><b><c:out value="${p.getNumPiloto()}" /></b></td>
							<td><b><c:out value="${p.getDebut()}" /></b></td>
							<td><b><c:out value="${p.getMundiales()}" /></b></td>
							<td><b><c:out value="${p.getSueldo()}" />€</b></td>
							<td><b><c:out value="${p.getTemporada()}" /></b></td>
							<td><a href="modificarPiloto.jsp?aux=${aux}"
								class="glyphicon glyphicon-edit"> <span
									class="glyphicons glyphicons-pencil"></span></a></td>
						</tr>
						<c:set var="aux" value="${aux+1}" />
					</c:forEach>
					</c:if>
				</table>
				<c:if test="${empty lpe}">
					<h4 align=center>No se ha encontrado pilotos</h4>
				</c:if>
				<form>
					<a href="nuevoPiloto.jsp" class="col-md-1 btn btn-info btn-sm"><fmt:message key="nuevoPiloto" bundle="${mensajes}" /></a> 
					<input class="col-md-1 col-md-offset-1 btn btn-warning btn-sm" type="button" value="Volver" name="Back2" onclick="history.back()"/>
				</form>
		</div>
	</div>
</body>
</html>