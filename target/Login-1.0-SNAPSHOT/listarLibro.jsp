
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="template/HeaderMenu.jsp"/>

<%
    LibroDAO dao = new LibroDAO();
    /*
    List<Libro> lista = dao.listar();
    */
    String filtro = request.getParameter("busqueda");
List<Libro> lista;
if (filtro != null && !filtro.trim().isEmpty()) {
    lista = dao.buscar(filtro.trim());
} else {
    lista = dao.listar();
}

    int totalLibros = lista.size();
    int librosPorPagina = 20;
    int totalPaginas = (int) Math.ceil((double) totalLibros / librosPorPagina);

    String paginaStr = request.getParameter("pagina");
    int paginaActual = 1;
    if (paginaStr != null) {
        try {
            paginaActual = Integer.parseInt(paginaStr);
            if (paginaActual < 1) {
                paginaActual = 1;
            }
            if (paginaActual > totalPaginas) {
                paginaActual = totalPaginas;
            }
        } catch (NumberFormatException e) {
            paginaActual = 1;
        }
    }

    int inicio = (paginaActual - 1) * librosPorPagina;
    int fin = Math.min(inicio + librosPorPagina, totalLibros);
    List<Libro> paginaLibros = lista.subList(inicio, fin);
%>

<div class="container mt-4">
    <h1 class="text-center">Listado de Libros</h1>
    <%--
    <a href="formLibro.jsp" class="btn btn-primary mb-3">Agregar Nuevo Libro</a>
    --%>
    <!-- Botón para mostrar el modal -->
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#modalAgregarLibro">
        Agregar Nuevo Libro
    </button>
    <form method="get" class="row g-3 mb-3" action="listarLibro.jsp">
        <div class="col-md-10">
            <input type="text" name="busqueda" class="form-control" placeholder="Buscar por título, autor o ISBN..." value="<%= request.getParameter("busqueda") != null ? request.getParameter("busqueda") : ""%>">
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary w-100">Buscar</button>
        </div>
    </form>
    <table class="table table-dark table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>ISBN</th>
                <th>Tipo libro</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Editorial</th>
                <th width="180">Año</th>
                <th>Categoría</th>
                <th>Cantidad</th>
                <th width="180">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Libro l : paginaLibros) {
            %>
            <tr>
                <td><%= l.getId()%></td>
                <td><%= l.getIsbn()%></td>
                <td><%= l.getTipoLibroTexto()%></td>
                <td><%= l.getTitulo()%></td>
                <td><%= l.getAutor()%></td>
                <td><%= l.getEditorial()%></td>
                <td><%= l.getAnioPublicacion()%></td>
                <td><%= l.getCategoria()%></td>
                <td><%= l.getCantidad()%></td>
                <td>
                    <a href="ControladorLibro?accion=Editar&id_libro=<%=l.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="ControladorLibro?accion=eliminar&id=<%=l.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Deseas eliminar este libro?')">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Paginación -->
    <nav>
        <ul class="pagination justify-content-center">
            <%
                for (int i = 1; i <= totalPaginas; i++) {
            %>
            <li class="page-item <%= (i == paginaActual) ? "active" : ""%>">
                <a class="page-link" href="listarLibro.jsp?pagina=<%= i%>"><%= i%></a>
            </li>
            <% }%>
        </ul>
    </nav>
</div>

<!-- Modal para agregar libro -->
<div class="modal fade" id="modalAgregarLibro" tabindex="-1" aria-labelledby="modalAgregarLibroLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content text-dark">
            <form action="ControladorLibro" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarLibroLabel">Agregar Nuevo Libro</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="accion" value="guardar">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>ISBN:</label>
                            <input type="text" name="isbn" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label>Título:</label>
                            <input type="text" name="titulo" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label>Autor:</label>
                            <input type="text" name="autor" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label>Editorial:</label>
                            <input type="text" name="editorial" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label>Año de Publicación:</label>
                            <input type="date" name="anioPublicacion" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label>Categoría:</label>
                            <input type="text" name="categoria" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label>Cantidad:</label>
                            <input type="number" name="cantidad" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label>Tipo Libro:</label>
                            <select name="tipoLibro" class="form-select" required>
                                <option value="1">Digital</option>
                                <option value="2">Físico</option>
                                <option value="3">Ambos</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>ID Usuario Registro:</label>
                            <input type="number" name="usuarioRegister" class="form-control" value="1" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="template/Footer.jsp"/>
