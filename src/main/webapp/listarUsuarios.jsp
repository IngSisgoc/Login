<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, modelo.Usuario" %>
<%@ page import="modelo.UsuarioDAO" %>

<html>
    <head>
        <jsp:include page="template/HeaderMenu.jsp"/>
    </head>
    <body>

        <%
            if (session.getAttribute("NombreUsu") == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            UsuarioDAO dao = new UsuarioDAO();
            List<Usuario> lista = dao.listar();
        %>

        <div class="container mt-4">
            <h1 class="text-center">Lista de Usuarios</h1>
            <a href="nuevoUsuario.jsp" class="btn btn-primary mb-3">Nuevo Usuario</a>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Foto</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Usuario u : lista) {
                            if (u.getIdUsuario() > 0) {
                    %>
                    <tr>
                        <td><%= u.getIdUsuario()%></td>
                        <td><%= u.getNombreUsu()%></td>
                        <td><%= u.getCorreo()%></td>
                        <td><%= u.getRol()%></td>
                        <td>
                            <img src="img/perfiles/<%= u.getImagen()%>" width="50" height="50"
                                 style="object-fit: cover; border-radius: 50%;" alt="Foto">
                        </td>
                        <td>
                            <a href="#" class="btn btn-warning btn-sm"
                               data-bs-toggle="modal"
                               data-bs-target="#modalEditarUsuario"
                               data-id="<%= u.getIdUsuario()%>"
                               data-nom="<%= u.getNombreUsu()%>"
                               data-correo="<%= u.getCorreo()%>"
                               data-rol="<%= u.getRol()%>"
                               data-imagen="<%= u.getImagen()%>">Editar</a>

                            <a href="ControladorUsuario?accion=eliminarUsuario&id=<%= u.getIdUsuario()%>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Deseas eliminar este usuario?')">Eliminar</a>
                        </td>
                    </tr>
                    <%  }
                }%>
                </tbody>
            </table>
        </div>

        <!-- Modal para editar -->
        <div class="modal fade" id="modalEditarUsuario" tabindex="-1"
             aria-labelledby="modalLabelEditarUsuario" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog">
                <form action="ControladorUsuario" method="post" enctype="multipart/form-data" class="modal-content bg-white" style="border: 1px solid #ccc;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabelEditarUsuario">Editar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="accion" value="actualizarUsuario">
                        <input type="hidden" name="id" id="editUserId">
                        <input type="hidden" name="imagenActual" id="editUserImagen">

                        <div class="mb-3 text-center">
                            <img id="previewImagen" src="" width="80" height="80"
                                 style="object-fit: cover; border-radius: 50%;">
                        </div>

                        <div class="mb-3">
                            <label>Nueva foto (opcional)</label>
                            <input type="file" name="foto" class="form-control" accept="image/*">
                        </div>

                        <div class="mb-3">
                            <label>Nombre</label>
                            <input type="text" name="nombre" id="editUserName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Correo</label>
                            <input type="email" name="correo" id="editUserEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Rol</label>
                            <select name="rol" id="editUserRol" class="form-select" required>
                                <option value="admin">admin</option>
                                <option value="Supervisor">Supervisor</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Guardar cambios</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </form>

            </div>
        </div>

        <jsp:include page="template/Footer.jsp"/>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var modalEditarUsuario = document.getElementById('modalEditarUsuario');
                if (modalEditarUsuario) {
                    modalEditarUsuario.addEventListener('show.bs.modal', function (event) {
                        var button = event.relatedTarget;

                        var id = button.getAttribute('data-id');
                        var nombre = button.getAttribute('data-nom');
                        var correo = button.getAttribute('data-correo');
                        var rol = button.getAttribute('data-rol');
                        var imagen = button.getAttribute('data-imagen');

                        modalEditarUsuario.querySelector('#editUserId').value = id;
                        modalEditarUsuario.querySelector('#editUserName').value = nombre;
                        modalEditarUsuario.querySelector('#editUserEmail').value = correo;
                        modalEditarUsuario.querySelector('#editUserRol').value = rol;
                        modalEditarUsuario.querySelector('#editUserImagen').value = imagen;

                        var preview = modalEditarUsuario.querySelector('#previewImagen');
                        preview.src = 'img/perfiles/' + imagen;
                    });
                }
            });
        </script>

    </body>
</html>


