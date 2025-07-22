package controlador;

import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Reserva;
import modelo.ReservaDAO;

@WebServlet(name = "ControladorReserva", urlPatterns = {"/ControladorReserva"})
public class ControladorReserva extends HttpServlet {

    ReservaDAO dao = new ReservaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("reservar".equals(accion)) {
            try {
                Reserva r = new Reserva();
                r.setIdLibro(Integer.parseInt(request.getParameter("idLibro")));
                r.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                r.setFechaReserva(sdf.parse(request.getParameter("fechaReserva")));
                r.setFechaDevolucion(sdf.parse(request.getParameter("fechaDevolucion")));
                r.setEstado("Reservado");
                dao.agregar(r);

                response.sendRedirect("listarReservas.jsp");  // Redirige a donde tú quieras
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
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
}

