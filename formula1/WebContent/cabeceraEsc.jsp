<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="./Estilos/cabeceraEsc.css">
<jsp:useBean id="esc" class="beans.Escuderia" scope="session"/>

	<c:if test="${empty esc.nombreEscuderia}">
		<jsp:forward page="index.jsp" />
	</c:if>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">Inicio</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Equipo <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Informacion</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="pilotos.jsp">Pilotos</a></li>
            <li><a href="mecanicos.jsp">Mecanicos</a></li>
          </ul>
        </li>
           <li class="active"><a href="#">Noticias <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="cambiarFoto.jsp"><img src="img/${esc.foto}" class="img-circle"></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${esc.nombreEscuderia} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Ver perfil</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="cerrarSesion.jsp">Cerrar Sesion</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-12"> -->
<!-- 			<h2> -->
<!-- 				<div class="col-md-3-offset-9"> -->
<!-- 					<form action="cambiarFoto.jsp" method="post" -->
<!-- 						accept-charset="iso-8859-1"> -->
<!-- 						<input class="img-thumbnail img-responsive" type="image" -->
<%-- 							src="img/${esc.foto}" --%>
<%-- 							title="<fmt:message key="pulse" bundle="${mensajes}"/>" --%>
<!-- 							alt="Sin imagen" width="15%"> -->
<!-- 					</form> -->
<%-- 					<a href="modificarJefe.jsp" class="btn btn-info btn-sm"><fmt:message --%>
<%-- 							key="editarPerfil" bundle="${mensajes}" /></a> --%>
<!-- 				</div> -->
<!-- 				<div class="col-md-3"> -->
<%-- 				<b>${esc.nombreEscuderia} (${esc.pais})</b><br> <b --%>
<%-- 					id="subtitulo">Año de fundacion: ${esc.anoFundacion}</b> --%>
<!-- 				</div> -->
<!-- 					<form action="cerrarSesion.jsp" method="post"> -->
<!-- 						<input class="btn btn-warning" type="submit" -->
<%-- 							value="<fmt:message key="cerrarSesion" bundle="${mensajes}"/>" /> --%>
<!-- 					</form> -->
<!-- 			</h2> -->