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
        <div class="container col-lg-3">
            <form action="ControladorUsuario">
                <div class="mt-1 text-center">
                    <img src="img/usuario.png" height="80" width="80" alt="Usuario"/>
                    <p class="mt-2"><strong>BIENVENIDOS</strong></p>
                </div>
                <div class="mt-1">
                    <label>Correo</label>
                    <input class="form-control mt-1" type="email" name="txtCorreo" placeholder="Example@gmail.com">
                </div>
                <div class="form-group mt-3 position-relative">
                    <label for="password">Contraseña:</label>
                    <input type="password" class="form-control mt-1" id="passwordInput" name="txtContraseña" placeholder="Ingrese contraseña">
                    <%--
                    Icono de ojos funcion 
                    --%>
                    <span onclick="togglePassword()" style="position:absolute; top: 38px; right: 10px; cursor:pointer;">
                        <i id="eyeIcon" class="bi bi-eye-slash"></i>
                    </span>
                </div>
                <input class="btn btn-danger w-100 mt-2" type="submit" name="accion" value="Ingresar">
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <script>
                        function togglePassword() {
                            const input = document.getElementById("passwordInput");
                            const icon = document.getElementById("eyeIcon");
                            if (input.type === "text") {
                                input.type = "password";
                                icon.classList.remove("bi-eye");
                                icon.classList.add("bi-eye-slash");
                            } else {
                                input.type = "text";
                                icon.classList.remove("bi-eye-slash");
                                icon.classList.add("bi-eye");
                            }
                        }
        </script>
    </body>
</html>
