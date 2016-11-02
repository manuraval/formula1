<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%-- <%@ taglib prefix="fmt" uri="http://java.sun/jsp/jstl/fmt"%>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Zona Jefes</title>
</head>
<body>
	<jsp:include page="cabeceraJefes.jsp"/>
        <div class="container"> 

            <c:set var="lp" value="${datos.getPiloto(param['login'])}" scope="session"/>

            <div class="row">
                <%--Contador para pasar como parametro--%>
                <c:set var="aux" value="${0}"/>
                <br>
                <br>
                <div>
                    <div id="tabla">
                        <h3 class="col-md-6 col-md-offset-5">Pilotos</h3>
                        <table class="table">
                            <th><fmt:message key="nombrePiloto" bundle="${mensajes}"/></th>
                            <th><fmt:message key="numPiloto" bundle="${mensajes}"/></th>
                            <th><fmt:message key="sueldo" bundle="${mensajes}"/></th>
                            <th><fmt:message key="debut" bundle="${mensajes}"/></th>
                            <th><fmt:message key="mundiales" bundle="${mensajes}"/></th>
                            <th class="hidden-xs"><fmt:message key="temporada" bundle="${mensajes}"/></th>

                            <%--Recorremos la lista y mostramos los pilotos--%>  
                            <c:forEach items="${lp}" var="p">
                                <tr>
                                    <td><b><a href="modificarPiloto.jsp?aux=${aux}"><c:out value="${p.getNombrePiloto()}"/></a></b></td>
                                    <td><b><c:out value="${p.getNumPiloto()}"/></b></td>
                                    <td><b><c:out value="${p.getSueldo()}"/></b></td>
                                    <td><b><c:out value="${p.getDebut()}"/></b></td>
                                    <td><b><c:out value="${p.getMundiales()}"/></b></td>
                                    <td class="hidden-xs"><b><c:out value="${p.getTemporada()}"/></b></td>
                                </tr>
                                <c:set var="aux" value="${aux+1}"/>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                            
        <div class="container"> 

            <%--<c:set var="lm" value="${datos.getMecanicos(param['login'])}" scope="session"/>--%>

            <div class="row">
                <%--Contador para pasar como parametro--%>
                <c:set var="aux" value="${0}"/>
                <br>
                <br>
                <div>
                    <div id="tabla">
                        <h3 class="col-md-6 col-md-offset-5">Mecanicos</h3>
                        <table class="table">
                            <th><fmt:message key="nombreMecanico" bundle="${mensajes}"/></th>
                            <th><fmt:message key="dniMecanico" bundle="${mensajes}"/></th>
                            <th><fmt:message key="sueldo" bundle="${mensajes}"/></th>
                            <th><fmt:message key="cargo" bundle="${mensajes}"/></th>
                            <th><fmt:message key="contrato" bundle="${mensajes}"/></th>
                            <th class="hidden-xs"><fmt:message key="temporada" bundle="${mensajes}"/></th>

                            <%--Recorremos la lista y mostramos los pilotos--%>  
                            <c:forEach items="${lm}" var="m">
                                <tr>
                                    <td><b><a href="modificarMecanico.jsp?aux=${aux}"><c:out value="${m.getNombreMecanico()}"/></a></b></td>
                                    <td><b><c:out value="${m.getDniMecanico()}"/></b></td>
                                    <td><b><c:out value="${m.getSueldo()}"/></b></td>
                                    <td><b><c:out value="${m.getCargo()}"/></b></td>
                                    <td><b><c:out value="${m.getContrato()}"/></b></td>
                                    <td class="hidden-xs"><b><c:out value="${m.getTemporada()}"/></b></td>
                                </tr>
                                <c:set var="aux" value="${aux+1}"/>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <form action="#" method="post">
                  <input class="btn btn-info col-md-offset-11" type="submit" value="<fmt:message key="participar" bundle="${mensajes}"/>" />
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>