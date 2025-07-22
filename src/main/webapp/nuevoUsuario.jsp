<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Usuario</title>
        <jsp:include page="template/HeaderMenu.jsp"/>
    </head>
    <body>
        <div class="container mt-5 col-md-6">
            <h2>Registrar Nuevo Usuario</h2>

            <!-- IMPORTANTE: enctype para subir archivos -->
            <form action="ControladorUsuario" method="post" enctype="multipart/form-data">
                <input type="hidden" name="accion" value="registrarUsuario">

                <div class="mb-3">
                    <label>Nombre:</label>
                    <input type="text" name="nombre" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Correo:</label>
                    <input type="email" name="correo" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Contraseña:</label>
                    <input type="password" name="clave" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Rol:</label>
                    <select name="rol" class="form-select" required>
                        <option value="admin">admin</option>
                        <option value="Supervisor">Supervisor</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label>Foto de perfil:</label>
                    <input type="file" name="foto" class="form-control" accept="image/*">
                </div>

                <button type="submit" class="btn btn-primary">Registrar</button>
                <a href="listarUsuarios.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
        <jsp:include page="template/Footer.jsp"/>
    </body>
</html>
