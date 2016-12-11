<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="esc" class="beans.Escuderia" scope="session"/>

<!-- Comprobamos que el login y las contraseña son correctos -->
<c:if test="${!empty param['login']}">
    <c:set var="login" value="${esc.identificar(param['login'], param['pass'])}" scope="session"/>

    <c:choose>
    	<c:when test="${login}">
        
         	<!DOCTYPE html> 
  <html>  
  <head>  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
  <title><fmt:message key="zonaEscuderia" bundle="${mensajes}" /></title>  
  <link rel="shortcut icon" href="./Images/formula1.gif" type="image/gif" />  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">  

<!--   Bootstrap core CSS   -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
  <link rel="stylesheet" href="./Estilos/zonaJefes.css">  
  </head>  
  <body>  
  	<jsp:include page="cabeceraEsc.jsp" />  
	
	
   	<div class="container">  
   	<h2>Inicio</h2>  
 	
   	<p>La escuderia ${esc.nombreEscuderia} tiene su sede en ${esc.pais} y se fundó en el año ${esc.anoFundacion}.</p>  
 	
  <div align="center" class="embed-responsive embed-responsive-4by3">  
  <h2 align="left">Documental</h2>  
      <video controls class="embed-responsive-item">  
          <source src="./Videos/Documental.mp4" type="video/mp4">  
      </video>  
  </div>  
  </div>  

<%--   			<c:set var="lje" value="${datos.getJefeEsc(esc.nombreEscuderia)}" scope="session" />   --%>
<%--   			<c:set var="lme" value="${mecanic.getMecEsc(esc.nombreEscuderia)}" scope="session" />   --%>
			
<!--   			<h3 align="center">Jefe</h3>   -->
<!--   			<div id="tabla">   -->
<%--   				<c:if test="${!empty lje}">   --%>
<!--   					<table class="table">   -->

<%--   						<th><fmt:message key="nombre" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="apellidos" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="dniJefe" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="sexo" bundle="${mensajes}" /></th>   --%>
<!--   						<th>&nbsp;</th>   -->
						
<!-- <!--   						Recorremos la lista y mostramos los medicos   -->
<%--   						<c:forEach items="${lje}" var="j">   --%>
<!--   							<tr class="fila">   -->
<%--   								<td><b><c:out value="${j.getNombreJefe()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${j.getApellidos()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${j.getDniJefe()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${j.getSexo()}" /></b></td>   --%>
<!--   								<td>   -->
<%--   									<a href="modificarJefe.jsp?aux=${aux}" class="glyphicon glyphicon-edit"></a>   --%>
<%--   									<a href="modificarPiloto.jsp?aux=${aux}" class="glyphicons glyphicons-bin"></a>   --%>
<!--   								</td>   -->
<!--   							</tr>   -->
<%--   							<c:set var="aux" value="${aux+1}" />   --%>
<%--   						</c:forEach>   --%>
<%--   						</c:if>   --%>
<!--   					</table>   -->
<%--   					<c:if test="${empty lje}">   --%>
<!--   						<h4 align=center>No se ha encontrado jefes</h4>   -->
<%--   						<a href="nuevoJefe.jsp" class="col-md-offset-10 btn btn-info btn-sm"><fmt:message key="nuevoPiloto" bundle="${mensajes}" /></a>   --%>
<%--   					</c:if>   --%>
<!--   			</div>   -->
<!--   			<br>   -->
  			 
<!--   			<h3 align="center">Mecanicos</h3>   -->
<!--   			<div id="tabla">   -->
			
<%--   				<c:if test="${!empty lme}">   --%>
<!--   					<table class="table">   -->

<%--   						<th><fmt:message key="nombre" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="dni" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="cargo" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="sueldo" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="contrato" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="coche" bundle="${mensajes}" /></th>   --%>
<%--   						<th><fmt:message key="temporada" bundle="${mensajes}" /></th>   --%>

<!-- <!--   						Recorremos la lista y mostramos los medicos   -->
<%--   						<c:forEach items="${lme}" var="m">   --%>

<!--   							<tr class="table-hover">   -->
<%--   								<td><b><a href="modificarMecanico.jsp?aux=${aux}"><c:out value="${m.getNombreMecanico()}" /></a></b></td>   --%>
<%--   								<td><b><c:out value="${m.getDniMecanico()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${m.getCargo()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${m.getSueldo()}" />€</b></td>   --%>
<%--   								<td><b><c:out value="${m.getContrato()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${m.getCoche()}" /></b></td>   --%>
<%--   								<td><b><c:out value="${m.getTemporada()}" /></b></td>   --%>
<!--   							</tr>   -->
<%--   							<c:set var="aux" value="${aux+1}" />   --%>
<%--   						</c:forEach>   --%>
<%--   						</c:if>   --%>
<!--   					</table>   -->
<%--   					<c:if test="${empty lme}">   --%>
<!--   						<h4 align=center>No se ha encontrado mecanicos</h4>   -->
<%--   					</c:if>   --%>
<%--   					<a href="nuevoMecanico.jsp" class="col-md-offset-10 btn btn-info btn-sm"><fmt:message key="nuevoMecanico" bundle="${mensajes}" /></a>   --%>
<!--   			</div>   -->
        </c:when>
        <c:otherwise>
			<jsp:forward page="index.jsp"></jsp:forward>        
        </c:otherwise>
    </c:choose> 
    
</c:if>



<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<%-- <title><fmt:message key="zonaEscuderia" bundle="${mensajes}" /></title> --%>
<!-- <link rel="shortcut icon" href="./Images/formula1.gif" type="image/gif" /> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->

<!-- <!-- Bootstrap core CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="./Estilos/zonaJefes.css"> -->
<!-- </head> -->
<!-- <body> -->
<%-- 	<jsp:include page="cabeceraEsc.jsp" /> --%>
	
	
<!--  	<div class="container"> -->
<!--  	<h2>Inicio</h2> -->
 	
<%--  	<p>La escuderia ${esc.nombreEscuderia} tiene su sede en ${esc.pais} y se fundó en el año ${esc.anoFundacion}.</p> --%>
 	
<!-- <div align="center" class="embed-responsive embed-responsive-4by3"> -->
<!-- <h2 align="left">Documental</h2> -->
<!--     <video controls class="embed-responsive-item"> -->
<!--         <source src="./Videos/Documental.mp4" type="video/mp4"> -->
<!--     </video> -->
<!-- </div> -->
<!-- </div> -->

<%-- 			<c:set var="lje" value="${datos.getJefeEsc(esc.nombreEscuderia)}" scope="session" /> --%>
<%-- 			<c:set var="lme" value="${mecanic.getMecEsc(esc.nombreEscuderia)}" scope="session" /> --%>
			
<!-- 			<h3 align="center">Jefe</h3> -->
<!-- 			<div id="tabla"> -->
<%-- 				<c:if test="${!empty lje}"> --%>
<!-- 					<table class="table"> -->

<%-- 						<th><fmt:message key="nombre" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="apellidos" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="dniJefe" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="sexo" bundle="${mensajes}" /></th> --%>
<!-- 						<th>&nbsp;</th> -->
						
<%-- 						Recorremos la lista y mostramos los medicos --%>
<%-- 						<c:forEach items="${lje}" var="j"> --%>
<!-- 							<tr class="fila"> -->
<%-- 								<td><b><c:out value="${j.getNombreJefe()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${j.getApellidos()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${j.getDniJefe()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${j.getSexo()}" /></b></td> --%>
<!-- 								<td> -->
<%-- 									<a href="modificarJefe.jsp?aux=${aux}" class="glyphicon glyphicon-edit"></a> --%>
<%-- 									<a href="modificarPiloto.jsp?aux=${aux}" class="glyphicons glyphicons-bin"></a> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 							<c:set var="aux" value="${aux+1}" /> --%>
<%-- 						</c:forEach> --%>
<%-- 						</c:if> --%>
<!-- 					</table> -->
<%-- 					<c:if test="${empty lje}"> --%>
<!-- 						<h4 align=center>No se ha encontrado jefes</h4> -->
<%-- 						<a href="nuevoJefe.jsp" class="col-md-offset-10 btn btn-info btn-sm"><fmt:message key="nuevoPiloto" bundle="${mensajes}" /></a> --%>
<%-- 					</c:if> --%>
<!-- 			</div> -->
<!-- 			<br> -->
<!-- 			
<!-- 			<h3 align="center">Mecanicos</h3> -->
<!-- 			<div id="tabla"> -->
			
<%-- 				<c:if test="${!empty lme}"> --%>
<!-- 					<table class="table"> -->

<%-- 						<th><fmt:message key="nombre" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="dni" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="cargo" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="sueldo" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="contrato" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="coche" bundle="${mensajes}" /></th> --%>
<%-- 						<th><fmt:message key="temporada" bundle="${mensajes}" /></th> --%>

<%-- 						Recorremos la lista y mostramos los medicos --%>
<%-- 						<c:forEach items="${lme}" var="m"> --%>

<!-- 							<tr class="table-hover"> -->
<%-- 								<td><b><a href="modificarMecanico.jsp?aux=${aux}"><c:out value="${m.getNombreMecanico()}" /></a></b></td> --%>
<%-- 								<td><b><c:out value="${m.getDniMecanico()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${m.getCargo()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${m.getSueldo()}" />€</b></td> --%>
<%-- 								<td><b><c:out value="${m.getContrato()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${m.getCoche()}" /></b></td> --%>
<%-- 								<td><b><c:out value="${m.getTemporada()}" /></b></td> --%>
<!-- 							</tr> -->
<%-- 							<c:set var="aux" value="${aux+1}" /> --%>
<%-- 						</c:forEach> --%>
<%-- 						</c:if> --%>
<!-- 					</table> -->
<%-- 					<c:if test="${empty lme}"> --%>
<!-- 						<h4 align=center>No se ha encontrado mecanicos</h4> -->
<%-- 					</c:if> --%>
<%-- 					<a href="nuevoMecanico.jsp" class="col-md-offset-10 btn btn-info btn-sm"><fmt:message key="nuevoMecanico" bundle="${mensajes}" /></a> --%>
<!-- 			</div> -->
 		</div>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>
