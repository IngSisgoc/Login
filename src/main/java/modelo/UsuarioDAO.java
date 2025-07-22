package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO implements Validar {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public int validar(Usuario usu) {
        int r = 0;
        String sql = "Select * from usuarios where correo=? and clave=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getCorreo());
            ps.setString(2, usu.getContraseña());
            rs = ps.executeQuery();
            while (rs.next()) {
                r = r + 1;
                usu.setCorreo(rs.getString("CORREO"));
                usu.setNombreUsu(rs.getString("NOMBRE"));
                // usu.setContraseña(rs.getString("CORREO"));
                usu.setRol(rs.getString("ROL"));
                usu.setImagen(rs.getString("FOTO"));
            }
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }

    }

    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "select * from usuarios";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("IDUSUARIO"));
                u.setNombreUsu(rs.getString("NOMBRE"));
                u.setCorreo(rs.getString("CORREO"));
                u.setRol(rs.getString("ROL"));
                u.setImagen(rs.getString("FOTO"));
                lista.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean registrar(Usuario u) {
        String sql = "INSERT INTO USUARIOS(NOMBRE, CORREO, CLAVE, ROL, FOTO) VALUES (?, ?, ?, ?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombreUsu());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getContraseña());
            ps.setString(4, u.getRol());
            ps.setString(5, u.getImagen());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE idUsuario=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0; // Retorna true si se eliminó al menos una fila
        } catch (Exception e) {
            System.err.println("Error al eliminar usuario: " + e.getMessage());
            return false;
        } finally {
            // Cerrar recursos (PreparedStatement, Connection)
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.err.println("Error al cerrar recursos en eliminar: " + e.getMessage());
            }
        }
    }
    
    public boolean actualizar(Usuario u) {
        // La consulta SQL para actualizar los campos del usuario
        // Asegúrate de que los nombres de las columnas coincidan con tu base de datos
        String sql = "UPDATE usuarios SET NOMBRE=?, CORREO=?, ROL=? , FOTO=? WHERE idUsuario=?";
        try {
            con = cn.getConnection(); // Obtener la conexión a la base de datos
            ps = con.prepareStatement(sql); // Preparar la consulta SQL

            // Establecer los parámetros de la consulta
            ps.setString(1, u.getNombreUsu());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getRol());
            ps.setString(4, u.getImagen());
            ps.setInt(5, u.getIdUsuario()); // El ID para identificar qué usuario actualizar

            int filasAfectadas = ps.executeUpdate(); // Ejecutar la actualización
            return filasAfectadas > 0; // Retorna true si al menos una fila fue afectada (actualizada)
        } catch (Exception e) {
            System.err.println("Error al actualizar usuario: " + e.getMessage());
            return false;
        } finally {
            // Cerrar los recursos de la base de datos para evitar fugas de conexión
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.err.println("Error al cerrar recursos en actualizar: " + e.getMessage());
            }
        }
    }

}
