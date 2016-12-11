<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="esc" class="beans.Escuderia" scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="pilotos" bundle="${mensajes}" /></title>
<link rel="shortcut icon" href="./Images/formula1.gif" type="image/gif" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./Estilos/zonaJefes.css">
</head>
<body>
	<div class="container">
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
				<a href="nuevoPiloto.jsp"
					class="col-md-offset-10 btn btn-info btn-sm"><fmt:message
						key="nuevoPiloto" bundle="${mensajes}" /></a>
		</div>
	</div>
</body>