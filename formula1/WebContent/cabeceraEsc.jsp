<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="./Estilos/cabeceraEsc.css">
<div class="container">

	<c:if test="${empty esc.nombreEscuderia}">
		<jsp:forward page="index.jsp" />
	</c:if>

	<div class="row">
		<div class="col-md-12">
			<h2 class="col-md-offset-5">
				<b>${esc.nombreEscuderia} (${esc.pais})</b><br>
				<b id="subtitulo">Año de fundacion:  ${esc.añoFundacion}</b>
				<form action="cerrarSesion.jsp" method="post">
					<input class="btn btn-warning col-md-offset-10" type="submit"
						value="<fmt:message key="cerrarSesion" bundle="${mensajes}"/>" />
				</form>
			</h2>
			<form action="cambiarFoto.jsp" method="post"
				accept-charset="iso-8859-1">
				<input class="img-thumbnail img-responsive" type="image"
					src="img/${esc.foto}"
					title="<fmt:message key="pulse" bundle="${mensajes}"/>"
					alt="Sin imagen" width="15%">
			</form>
			<a href="modificarJefe.jsp" class="btn btn-info btn-sm"><fmt:message
					key="editarPerfil" bundle="${mensajes}" /></a>
		</div>
	</div>
</div>