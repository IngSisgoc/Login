<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!-- Estilos y recursos -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<link href="css/estilos.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark" style="color: white">
    <a href="${pageContext.request.contextPath}/Principal.jsp" class="navbar-toggler text-white">
        <span class="navbar-toggler-icon"></span> Home
    </a>
    <a href="${pageContext.request.contextPath}/formUsuario.jsp" style="color: white">Mantenimiento</a>
    <div class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="vistasDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Vistas
        </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listarUsuarios.jsp">Listar Usuarios</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listarLibro.jsp">Listar Libros</a></li>
        </ul>
    </div>
    <div class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="vistasDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Alertas
        </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/alertas.jsp">Préstamos a vencer</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/AlertasVencidas.jsp">Préstamos vencidos</a></li>
        </ul>
    </div>
    <a href="alertas.jsp" class="btn btn-dark position-relative">
        <i class="bi bi-bell-fill text-white fs-4"></i>
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
    </a>
    <div>
        <a href="#" class="nav-link dropdown-toggle text-white" data-bs-toggle="dropdown">Cerrar sesión</a>
        <div class="dropdown-menu dropdown-menu-end text-center">
            <a><img src="img/UsuarioAdministrador.png" height="80" width="80"/></a><br>
            <a>${nom}</a><br>
            <a>${correo}</a>
            <div class="dropdown-divider"></div>
            <a href="ControladorUsuario?accion=Salir" class="dropdown-item">Salir</a>
        </div>
    </div>
</nav>

