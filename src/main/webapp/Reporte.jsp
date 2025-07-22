<%--
<%@ page contentType="text/html;charset=UTF-8" %>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="modelo.AlertaDAO" %>
<%@ page import="modelo.Alerta" %>
<%--
<html>
<head>
  <title>Exportar Reporte</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
--%>
<%@include file="template/HeaderMenu.jsp" %>
<body>
    <h3 class="text-center mt-4">Reporte Mensual de Libros Prestados</h3>

    <div class="container mt-4 bg-white p-4 rounded shadow" style="max-width: 600px;">

        <form method="post" action="ReporteServlet">
            <div class="mb-3">
                <label for="mes" class="form-label">Selecciona el mes</label>
                <select class="form-select" name="mes" id="mes" required>
                    <option value="">-- Selecciona --</option>
                    <%
                        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                            "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
                        for (int i = 0; i < meses.length; i++) {
                    %>
                    <option value="<%= (i + 1)%>"><%= meses[i]%></option>
                    <% }%>
                </select>
            </div>
            <div class="mb-3">
                <label for="anio" class="form-label">Selecciona el año</label>
                <input type="number" name="anio" id="anio" class="form-control" required min="2000" max="2100" value="2025" />
            </div>
            <button type="submit" class="btn btn-primary">Exportar</button>
        </form>
                        <!-- Botón para mostrar las alertas -->
        <form method="get">
            <input type="hidden" name="verAlertas" value="true" />
            <button type="submit" class="btn btn-warning mt-3">Ver alertas de libros próximos a vencer</button>
        </form>
    </div>
          <!-- Mostrar alertas si se solicitó -->
    <%
        if ("true".equals(request.getParameter("verAlertas"))) {
            AlertaDAO dao = new AlertaDAO();
            List<Alerta> alertas = dao.obtenerAlertas();
    %>
      <div class="container mt-4 bg-white p-4 rounded shadow">
        <h5 class="text-danger">Libros próximos a vencer (en 3 días)</h5>
        <table class="table table-bordered table-hover mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Usuario</th>
                    <th>Libro</th>
                    <th>Fecha de vencimiento</th>
                    <th>Días restantes</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (alertas != null && !alertas.isEmpty()) {
                        for (Alerta a : alertas) {
                %>
                <tr>
                        <td><%= a.getUsuario() %></td>
                        <td><%= a.getLibro() %></td>
                        <td><%= a.getFechaVencimiento() %></td>
                        <td><%= a.getDiasRestantes() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">No hay libros próximos a vencer.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <%
        }
    %>  
</body>
        <%@ include file="template/Footer.jsp" %> 
