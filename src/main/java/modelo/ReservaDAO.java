package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class ReservaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

public boolean agregar(Reserva r) {
    String sql = "INSERT INTO RESERVAS (ID_LIBRO, ID_USUARIO, FECHA_RESERVA, FECHA_DEVOLUCION,ESTADO) VALUES (?, ?, ?, ?,?)";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, r.getIdLibro());
        ps.setInt(2, r.getIdUsuario());
        ps.setDate(3, new java.sql.Date(r.getFechaReserva().getTime()));
        ps.setDate(4, new java.sql.Date(r.getFechaDevolucion().getTime()));
        ps.setString(5, "RESERVADO");
        ps.executeUpdate();
        return true;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    public List<Reserva> listar() {
        List<Reserva> lista = new ArrayList<>();
        String sql = "SELECT r.ID_RESERVA, r.ID_LIBRO, r.ID_USUARIO, r.FECHA_RESERVA, r.FECHA_DEVOLUCION, "
                   + "u.NOMBRE AS nombre_usuario, l.TITULO AS titulo_libro,r.ESTADO "
                   + "FROM RESERVAS r "
                   + "JOIN USUARIOS u ON r.ID_USUARIO = u.IDUSUARIO "
                   + "JOIN LIBROS l ON r.ID_LIBRO = l.ID_LIBRO";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Reserva r = new Reserva();
                r.setIdReserva(rs.getInt("ID_RESERVA"));
                r.setIdLibro(rs.getInt("ID_LIBRO"));
                r.setIdUsuario(rs.getInt("ID_USUARIO"));
                r.setFechaReserva(rs.getDate("FECHA_RESERVA"));
                r.setFechaDevolucion(rs.getDate("FECHA_DEVOLUCION"));
                r.setNombreUsuario(rs.getString("nombre_usuario"));
                r.setTituloLibro(rs.getString("titulo_libro"));
                r.setEstado(rs.getString("Estado"));
                

                lista.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }


}

