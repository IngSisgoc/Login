package modelo;

import java.sql.*;
import java.util.*;

public class AlertaDAOvencido {

    private Conexion conexion; // Declara una instancia de tu clase Conexion

    // Constructor para inicializar la conexión
    public AlertaDAOvencido() {
        this.conexion = new Conexion(); // Instancia tu clase de conexión
    }

        public List<Alerta> obtenerAlertasVencidas() {
        List<Alerta> lista = new ArrayList<>();
        String sql = "SELECT p.Nombre AS usuario, pr.libro, pr.fecha_vencimiento, "
                   + "DATEDIFF(pr.fecha_vencimiento, CURDATE()) AS dias_restantes "
                   + "FROM prestamo pr "
                   + "INNER JOIN persona p ON pr.ID_persona = p.ID "
                   + "WHERE pr.fecha_vencimiento < CURDATE()"; // Condición para libros vencidos
        
        try (Connection con = conexion.getConnection(); // Aquí se reutiliza la conexión
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String usuario = rs.getString("usuario");
                String libro = rs.getString("libro");
                String fecha = rs.getString("fecha_vencimiento");
                int dias = rs.getInt("dias_restantes");

                lista.add(new Alerta(usuario, libro, fecha, dias));
            }

        } catch (SQLException e) { // Manejo específico de SQLException
            e.printStackTrace();
        }

        return lista;
    }

    
    
}
