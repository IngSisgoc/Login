package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.io.File;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
@MultipartConfig
public class ControladorUsuario extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();
    int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        if (accion == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (accion) {
            case "Ingresar":
                String correo = request.getParameter("txtCorreo");
                String contraseña = request.getParameter("txtContraseña");
                u.setCorreo(correo);
                u.setContraseña(contraseña);
                r = dao.validar(u);
                if (r == 1) {
                    request.getSession().setAttribute("Correo", correo);
                    request.getSession().setAttribute("NombreUsu", u.getNombreUsu());
                    request.getSession().setAttribute("Rol", u.getRol());
                    request.getSession().setAttribute("Imagen", u.getImagen());
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;

            case "registrarUsuario":
                String nombre = request.getParameter("nombre");
                String correoNuevo = request.getParameter("correo");
                String clave = request.getParameter("clave");
                String rol = request.getParameter("rol");

                Part filePartRegistro = request.getPart("foto");
                String nombreArchivoRegistro = "usuario.png";

                if (filePartRegistro != null && filePartRegistro.getSize() > 0) {
                    nombreArchivoRegistro = Paths.get(filePartRegistro.getSubmittedFileName()).getFileName().toString();
                    String rutaGuardar = getServletContext().getRealPath("/img/perfiles/") + nombreArchivoRegistro;
                    filePartRegistro.write(rutaGuardar);
                }

                Usuario nuevo = new Usuario();
                nuevo.setNombreUsu(nombre);
                nuevo.setCorreo(correoNuevo);
                nuevo.setContraseña(clave);
                nuevo.setRol(rol);
                nuevo.setImagen(nombreArchivoRegistro);

                dao.registrar(nuevo);
                response.sendRedirect("ControladorUsuario?accion=listarUsuarios");
                break;

            case "listarUsuarios":
                List<Usuario> listaUsuarios = dao.listar();
                request.setAttribute("listaUsuarios", listaUsuarios);
                request.getRequestDispatcher("listarUsuarios.jsp").forward(request, response);
                break;

            case "eliminarUsuario":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("ControladorUsuario?accion=listarUsuarios");
                break;

            case "actualizarUsuario":
                int idActualizar = Integer.parseInt(request.getParameter("id"));
                String nombreActualizar = request.getParameter("nombre");
                String correoActualizar = request.getParameter("correo");
                String rolActualizar = request.getParameter("rol");
                String imagenActual = request.getParameter("imagenActual");

                String nombreArchivoActualizar = imagenActual;
                Part filePartActualizar = request.getPart("foto");

                if (filePartActualizar != null && filePartActualizar.getSize() > 0) {
                    String nombreReal = filePartActualizar.getSubmittedFileName();
                    nombreArchivoActualizar = System.currentTimeMillis() + "_" + nombreReal;

                    String uploadPath = getServletContext().getRealPath("img/perfiles");
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }

                    filePartActualizar.write(uploadPath + File.separator + nombreArchivoActualizar);
                }

                Usuario userActualizar = new Usuario();
                userActualizar.setIdUsuario(idActualizar);
                userActualizar.setNombreUsu(nombreActualizar);
                userActualizar.setCorreo(correoActualizar);
                userActualizar.setRol(rolActualizar);
                userActualizar.setImagen(nombreArchivoActualizar);

                dao.actualizar(userActualizar);
                // Verifica si el usuario editado es el mismo que está en sesión
                String correoSesion = (String) request.getSession().getAttribute("Correo");
                if (correoSesion != null && correoSesion.equals(correoActualizar)) {
                    // Actualiza los datos en sesión
                    request.getSession().setAttribute("NombreUsu", nombreActualizar);
                    request.getSession().setAttribute("Correo", correoActualizar);
                    request.getSession().setAttribute("Rol", rolActualizar);
                    request.getSession().setAttribute("Imagen", nombreArchivoActualizar);
                }

                response.sendRedirect("ControladorUsuario?accion=listarUsuarios");
                break;

            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
