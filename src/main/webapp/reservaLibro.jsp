<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="template/HeaderMenu.jsp"/>

<%
    LibroDAO dao = new LibroDAO();
    List<Libro> listaLibros = dao.listar();
%>

<div class="container mt-4">
    <h2 class="text-center">Reserva de Libros</h2>

    <form action="ControladorReserva" method="post" class="row g-3">
        <input type="hidden" name="accion" value="reservar">
        <input type="hidden" name="estado" value="reservado">


        <div class="col-md-6">
            <label>Selecciona un Libro</label>
            <select name="idLibro" class="form-select" required>
                <option value="">-- Selecciona --</option>
                <% for (Libro l : listaLibros) {%>
                <option value="<%= l.getId()%>"><%= l.getTitulo()%> - <%= l.getAutor()%></option>
                <% } %>
            </select>
        </div>

        <div class="col-md-6">
            <label>Usuario:</label>
            <select name="idUsuario" class="form-select" required>
                <%
                    UsuarioDAO usuarioDAO = new UsuarioDAO();
                    List<Usuario> usuarios = usuarioDAO.listar(); // Asegúrate que este método devuelva la lista de usuarios
                    for (Usuario u : usuarios) {
                %>
                <option value="<%= u.getIdUsuario()%>"><%= u.getNombreUsu()%></option>
                <%
                    }
                %>
            </select>
        </div>


        <div class="col-md-6">
            <label>Fecha de Reserva</label>
            <input type="date" name="fechaReserva" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label>Fecha de Devolución</label>
            <input type="date" name="fechaDevolucion" class="form-control" required>
        </div>

        <div class="col-md-12">
            <button type="submit" class="btn btn-primary w-100">Reservar</button>
        </div>
    </form>
</div>

<jsp:include page="template/Footer.jsp"/>

