<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container"> 

    <c:if test="${empty jefe.dniJefe}">
        <jsp:forward page="index.jsp"/>
    </c:if>

    <div class="row">
         <div class="col-md-12">
            <h2 class="col-md-offset-5 hidden-xs"><b>${jefe.nombreJefe}</b></h2>
            <h6 class="col-md-offset-5 visible-xs"><b>${jefe.nombreJefe}</b> </h6> 
            <form action="cambiarFoto.jsp" method="post" accept-charset="iso-8859-1">
                <input class="img-thumbnail img-responsive" type="image" src="img/${jefe.foto}" title="<fmt:message key="pulse" bundle="${mensajes}"/>"
                       alt="Sin imagen" width="15%">
            </form>
            <a href="modificarJefe.jsp" class="btn btn-info btn-sm"><fmt:message key="editarPerfil" bundle="${mensajes}"/></a>
        </div>
        
        <div id="cerrar" class="text-right">
            <div class="form-group">
                <form action="cerrarSesion.jsp" method="post">
                    <input class="btn btn-warning col-md-offset-8" type="submit" value="<fmt:message key="cerrarSesion" bundle="${mensajes}"/>" />
                </form>
            </div>
        </div>
    </div>
</div>