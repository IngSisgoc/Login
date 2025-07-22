<%@page import="java.util.*, modelo.ReservaDAO, modelo.Reserva, modelo.Usuario, modelo.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="template/HeaderMenu.jsp"/>

<%
    ReservaDAO dao = new ReservaDAO();
    List<Reserva> lista = dao.listar();
%>

<div class="container mt-4">
    <h2 class="text-center mb-4"><i class="bi bi-book"></i>Listado de Reservas<i class="bi bi-journal-bookmark-fill"></i></h2>
    
    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Libro</th>
                <th>Usuario</th>
                <th>Fecha Reserva</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Reserva r : lista) {
            %>
            <tr>
                <td><%= r.getIdReserva() %></td>
                <td><%= r.getTituloLibro() %></td>
                <td><%= r.getNombreUsuario() %></td>
                <td><%= r.getFechaReserva() %></td>
                <td><%= r.getEstado() %></td>
                <td>
                    <!-- Aquí puedes agregar acciones como eliminar, cambiar estado, etc. -->
                    <a href="ControladorReserva?accion=eliminar&id=<%=r.getIdReserva()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Eliminar reserva?')">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<jsp:include page="template/Footer.jsp"/>

