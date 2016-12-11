<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="error" value=""/>
<c:if test="${!empty(param.error)}">
    <c:set var="error" value="${param.error}"/>
</c:if>

<%-- Si se ha subido la foto, actualizamos la propiedad foto del empleado --%>
<c:if test="${empty(error) && !empty(param.nombreFichero)}">
    <c:set target="${esc}" property="foto" value="${param.nombreFichero}"/>
    ${esc.cambiarFoto(esc.nombreEscuderia)}
</c:if>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./Images/favicon.png" type="image/png" />
<title>Cambiar Foto</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
    body{

        background-image: url(./Images/fondo2.jpg); 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        color: black;

    } 

</style>
</head>

<%-- Error devuelto por el servlet subirFoto --%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CambiarFoto</title>
        <script type="text/javascript">
            function actualizar() {
                if (confirm("¿Deseas cambiar la foto?")) {
                    document.forms["formulario"].submit();
                    return true;
                }
                else
                    return false;
            }
        </script>
    </head>
    <body>
        <div style="height: 20%; border: black; border-width: 5px;">
        </div>
        <br>

        <div class="container">
            <div class="row">

                <div class="col-md-5 col-md-offset-4">

                    <img  src="./Images/${esc.foto}" class="img-circle col-md-offset-2" alt="Foto no disponible" width="200px" >
                    <br>

                    <form id="formulario" action="subirFoto" method="post" enctype="multipart/form-data">
                        <br>
                        <div class="from-group">

                            <input type="file" class="file btn btn-file" multiple name="foto" onchange="actualizar();">
                            <input type="hidden" name="nombreFichero" value="medico${esc.nombreEscuderia}">
                        </div>

                    </form>
                    <form action="zonaEsc.jsp" method="post">
                        <input class="btn btn-primary" type="submit" value="Volver">
                    </form>
                    <br>
                    <div style="color:red;">
                        <h3>${error}</h3>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>