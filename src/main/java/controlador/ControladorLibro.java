package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Libro;
import modelo.LibroDAO;
import java.util.List;

@WebServlet(name = "ControladorLibro", urlPatterns = {"/ControladorLibro"})
public class ControladorLibro extends HttpServlet {

    LibroDAO dao = new LibroDAO();
    Libro libro = new Libro();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            response.sendRedirect("listarLibro.jsp");
            return;
        }

        switch (accion) {
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("listarLibro.jsp");
                break;

            default:
                response.sendRedirect("listarLibro.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            response.sendRedirect("listarLibro.jsp");
            return;
        }

        switch (accion) {
            case "guardar":
                libro.setIsbn(request.getParameter("isbn"));
                libro.setTitulo(request.getParameter("titulo"));
                libro.setAutor(request.getParameter("autor"));
                libro.setEditorial(request.getParameter("editorial"));
                libro.setAnioPublicacion(java.sql.Date.valueOf(request.getParameter("anioPublicacion")));
                libro.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                libro.setCategoria(request.getParameter("categoria"));
                libro.setUsuarioRegister(Integer.parseInt(request.getParameter("usuarioRegister")));
                libro.setFechaRegistro(new java.sql.Date(System.currentTimeMillis())); // <-- esta línea evita el error
                dao.agregar(libro);
                response.sendRedirect("listarLibro.jsp");
                break;

            case "actualizar":
                libro.setId(Integer.parseInt(request.getParameter("id_libro")));
                libro.setIsbn(request.getParameter("isbn"));
                libro.setTitulo(request.getParameter("titulo"));
                libro.setAutor(request.getParameter("autor"));
                libro.setEditorial(request.getParameter("editorial"));
                libro.setAnioPublicacion(java.sql.Date.valueOf(request.getParameter("anioPublicacion")));
                libro.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                libro.setCategoria(request.getParameter("categoria"));
                libro.setFechaRegistro(java.sql.Date.valueOf(request.getParameter("fechaRegistro")));
                libro.setUsuarioRegister(Integer.parseInt(request.getParameter("usuarioRegister")));
                dao.actualizar(libro);
                response.sendRedirect("listarLibro.jsp");
                break;

            default:
                response.sendRedirect("listarLibro.jsp");
                break;
        }
    }
}
