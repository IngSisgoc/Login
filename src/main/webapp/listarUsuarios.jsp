<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, modelo.Persona" %>
<%@ page import="modelo.PersonaDAO" %>

<html>
<head>
    <jsp:include page="template/HeaderMenu.jsp"/>
</head>
<body>

<%
    if (session.getAttribute("nom") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    PersonaDAO dao = new PersonaDAO();
    List<Persona> lista = dao.listar();
%>

<div class="container mt-4">
    <h2>Lista de Usuarios</h2>
    <a href="formUsuario.jsp" class="btn btn-primary mb-3">Nuevo Usuario</a>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Rol</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Persona p : lista) {
                    if (p.getId() > 0) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNom() %></td>
                <td><%= p.getCorreo() %></td>
                <td><%= p.getRol() %></td>
                <td>
                    <a href="#" class="btn btn-warning btn-sm"
                       data-bs-toggle="modal"
                       data-bs-target="#modalEditarUsuario"  <%-- Apunta al modal genérico --%>
                       data-id="<%= p.getId() %>"
                       data-nom="<%= p.getNom() %>"
                       data-correo="<%= p.getCorreo() %>"
                       data-rol="<%= p.getRol() %>">Editar</a>
                    <a href="Controlador?accion=eliminarUsuario&id=<%= p.getId() %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('¿Deseas eliminar este usuario?')">Eliminar</a>
                </td>
            </tr>
            <%      } // fin if %>
            <%  } // fin for %>
        </tbody>
    </table>
</div>

<div class="modal fade" id="modalEditarUsuario" tabindex="-1"
     aria-labelledby="modalLabelEditarUsuario" aria-hidden="true"
     data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog">
        <form action="Controlador" method="post" class="modal-content bg-white" style="border: 1px solid #ccc;">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabelEditarUsuario">Editar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="accion" value="actualizarUsuarioOk">
                <input type="hidden" name="id" id="editUserId"> <div class="mb-3">
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
                        <option value="Medico">Supervisor</option>
                       <%--
                        <option value="Paciente">Paciente</option>
                        <option value="Recepcion">Recepción</option>
                       --%>
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
    document.addEventListener('DOMContentLoaded', function() {
        var editModal = document.getElementById('modalEditarUsuario');
        editModal.addEventListener('show.bs.modal', function (event) {
            // Botón que activó el modal
            var button = event.relatedTarget; // Elemento <a> que disparó el modal

            // Extraer información de los atributos data-*
            var id = button.getAttribute('data-id');
            var nom = button.getAttribute('data-nom');
            var correo = button.getAttribute('data-correo');
            var rol = button.getAttribute('data-rol');

            // Obtener las referencias a los campos del formulario dentro del modal
            var modalUserId = editModal.querySelector('#editUserId');
            var modalUserName = editModal.querySelector('#editUserName');
            var modalUserEmail = editModal.querySelector('#editUserEmail');
            var modalUserRol = editModal.querySelector('#editUserRol');

            // Asignar los valores a los campos
            modalUserId.value = id;
            modalUserName.value = nom;
            modalUserEmail.value = correo;

            // Seleccionar la opción correcta en el select de Rol
            for (var i = 0; i < modalUserRol.options.length; i++) {
                if (modalUserRol.options[i].value === rol) {
                    modalUserRol.options[i].selected = true;
                    break;
                }
            }
        });
    });
</script>

</body>
</html>

