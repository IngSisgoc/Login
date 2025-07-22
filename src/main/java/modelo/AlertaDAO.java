
package modelo;

import java.sql.*;
import java.util.*;
import modelo.Alerta;

public class AlertaDAO {

    private final String URL = "jdbc:mysql://localhost:3306/biblioteca2";
    private final String USER = "root";
    private final String PASS = "123456"; // cambia si usas contraseña
    
    public List<Alerta> obtenerAlertas() {
        List<Alerta> lista = new ArrayList<>();
        String sql = "SELECT p.Nombre AS usuario, pr.libro, pr.fecha_vencimiento, "
           + "DATEDIFF(pr.fecha_vencimiento, CURDATE()) AS dias_restantes "
           + "FROM prestamo pr "
           + "INNER JOIN persona p ON pr.ID_persona = p.ID "
           + "WHERE pr.fecha_vencimiento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 DAY)";
        
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String usuario = rs.getString("usuario");
                String libro = rs.getString("libro");
                String fecha = rs.getString("fecha_vencimiento");
                int dias = rs.getInt("dias_restantes");

                lista.add(new Alerta(usuario, libro, fecha, dias));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    
    
}

