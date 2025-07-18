<%-- 
    Document   : Principal
    Created on : 17 jul. 2025, 6:38:29 p. m.
    Author     : ssistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <title>JSP Page</title>
    </head>
    <body>
<%@include file="template/HeaderMenu.jsp" %>
        <div class="container mt-4 bg-white">
            <h1>Bienvenido al sistema...<strong>${Correo}</strong> </h1>
            <a href="alertas.jsp" class="btn btn-info mt-3">Ver alertas de préstamos por vencer</a>

            <% if ("admin".equals(session.getAttribute("rol"))) { %>
            <div class="mt-3 d-flex gap-2">
                <a href="Reporte.jsp" class="btn btn-success">Exportar Reporte Mensual</a>
                <a href="gestionarPersonas.jsp" class="btn btn-warning">Gestionar Usuarios</a>
            </div>
            <% }%>
        </div>
                <%--
Agregando footer
        --%>
        <%@ include file="template/Footer.jsp" %> 
    </body>
</html>
