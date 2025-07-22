<%-- 
    Document   : alertas
    Created on : 09-jun-2025, 23:56:34
    Author     : User
--%>

<%@ page import="java.util.List" %>
<%@ page import="modelo.Alerta" %>
<%@ page import="modelo.AlertaDAOvencido" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="template/HeaderMenu.jsp" %>

<%
    AlertaDAOvencido dao = new AlertaDAOvencido();
    List<Alerta> alertas = dao.obtenerAlertasVencidas();
%>

<div class="container">
    <h2>📚 Alertas de Préstamos vencidos</h2>
    <%
        if (alertas.isEmpty()) {
    %>
        <div class="alert alert-success" role="alert">
            No hay alertas vencidas.
        </div>
    <%
        } else {
    %>
        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>📌 Usuario</th>
                    <th>📖 Libro</th>
                    <th>📅 Fecha de Vencimiento</th>
                    <th>⚠️ Días Restantes</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Alerta alerta : alertas) {
                %>
                    <tr>
                        <td><%= alerta.getUsuario() %></td>
                        <td><%= alerta.getLibro() %></td>
                        <td><%= alerta.getFechaVencimiento() %></td>
                        <td><%= alerta.getDiasRestantes() %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        }
    %>
</div>
<%@ include file="template/Footer.jsp" %>
