<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
    <c:if test="${empty jefes.nombreJefe}">
        <jsp:forward page="index.jsp"/>
    </c:if>    
    
    <div class="row">
        <br>
         <div class="col-md-12">
            <p class="col-md-offset-5 hidden-xs" style="float: right"><b>${jefes.nombreJefe}</b></p>
            <p class="col-md-offset-5 hidden-xs" style="float: right"><b>${jefes.dniJefe}</b></p>
            <h6 class="col-md-offset-5 visible-xs"><b>${jefes.nombreJefe} (${jefes.dniJefe})</b> </h6>
            <form action="cambiarFoto.jsp" method="post" accept-charset="iso-8859-1">
                <input class="img-circle img-responsive" type="image" src="img/${medic.foto}" title="<fmt:message key="pulse" bundle="${mensajes}"/>"
                       alt="Sin imagen" width="15%">
            </form>
                       <a href="#" class="btn btn-info btn-sm"><fmt:message key="editarPerfil" bundle="${mensajes}"/></a>
            <div id="cerrar" class="text-right">
                <div class="form-group">
                    <form action="cerrarSesion.jsp" method="post">
                        <input class="btn btn-warning col-md-offset-8" type="submit" value="<fmt:message key="cerrarSesion" bundle="${mensajes}"/>" />
                    </form>
                </div>
            </div>  
        </div>
    </div>
</div>