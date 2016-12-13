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
			<br> <img class="img-rounded" alt=""
			src="Images/mecanico.jpg" width="100%" height="250px">
		<c:set var="aux" value="${0}" />
		<c:set var="lme" value="${mecanic.getMecEsc(esc.nombreEscuderia)}"
			scope="session" />

   			<h3 align="center">Mecanicos</h3>
   			<div id="tabla">
			
   				<c:if test="${!empty lme}">
   					<table class="table">

   						<th><fmt:message key="nombre" bundle="${mensajes}" /></th>
   						<th><fmt:message key="dni" bundle="${mensajes}" /></th>
   						<th><fmt:message key="cargo" bundle="${mensajes}" /></th>
   						<th><fmt:message key="sueldo" bundle="${mensajes}" /></th>
   						<th><fmt:message key="contrato" bundle="${mensajes}" /></th> 
  						<th><fmt:message key="temporada" bundle="${mensajes}" /></th>
  						<th>&nbsp;</th>  

<!--    						Recorremos la lista y mostramos los medicos   -->
  						<c:forEach items="${lme}" var="m">  

  							<tr class="table-hover">  
  								<td><b><c:out value="${m.getNombreMecanico()}" /></b></td>  
  								<td><b><c:out value="${m.getDniMecanico()}" /></b></td>  
  								<td><b><c:out value="${m.getCargo()}" /></b></td>  
								<td><b><c:out value="${m.getSueldo()}" />€</b></td>
  								<td><b><c:out value="${m.getContrato()}" /></b></td>  
  								<td><b><c:out value="${m.getTemporada()}" /></b></td>  
								<td><a href="modificarMecanico.jsp?aux=${aux}"
								class="glyphicon glyphicon-edit"> <span
									class="glyphicons glyphicons-pencil"></span></a></td>
  							</tr>  
  							<c:set var="aux" value="${aux+1}" />  
  						</c:forEach>  
  						</c:if>  
  					</table>  
  					<c:if test="${empty lme}">  
  						<h4 align=center>No se ha encontrado mecanicos</h4>  
  					</c:if>  
				<form>
					<a href="nuevoMecanico.jsp" class="col-md-2 btn btn-info btn-sm"><fmt:message key="nuevoMecanico" bundle="${mensajes}" /></a> 
					<input class="col-md-1 col-md-offset-1 btn btn-warning btn-sm" type="button" value="Volver" name="Back2" onclick="history.back()"/>
				</form> 
  			</div>  
	</div>
</body>