package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LibroDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<Libro> listar() {
        List<Libro> lista = new ArrayList<>();
        String sql = "SELECT * FROM LIBROS";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Libro l = new Libro();
                l.setId(rs.getInt("ID_LIBRO"));
                l.setIsbn(rs.getString("ISBN"));
                l.setTipoLibro(rs.getInt("TIPO_LIBRO"));
                l.setTitulo(rs.getString("TITULO"));
                l.setAutor(rs.getString("AUTOR"));
                l.setEditorial(rs.getString("EDITORIAL"));
                l.setAnioPublicacion(rs.getDate("ANIO_PUBLICACION"));
                l.setCantidad(rs.getInt("CANTIDAD"));
                l.setCategoria(rs.getString("CATEGORIA"));
                l.setFechaRegistro(rs.getTimestamp("FECHA_REGISTRO"));
                l.setUsuarioRegister(rs.getInt("USUARIO_REGISTER"));

                lista.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
// Agregar un nuevo libro
public boolean agregar(Libro l) {
    String sql = "INSERT INTO LIBROS (ISBN, TIPO_LIBRO, TITULO, AUTOR, EDITORIAL, ANIO_PUBLICACION, CANTIDAD, CATEGORIA, FECHA_REGISTRO, USUARIO_REGISTER) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, l.getIsbn());
        ps.setInt(2, l.getTipoLibro());
        ps.setString(3, l.getTitulo());
        ps.setString(4, l.getAutor());
        ps.setString(5, l.getEditorial());
        ps.setDate(6, new java.sql.Date(l.getAnioPublicacion().getTime()));
        ps.setInt(7, l.getCantidad());
        ps.setString(8, l.getCategoria());
        ps.setTimestamp(9, new java.sql.Timestamp(l.getFechaRegistro().getTime()));
        ps.setInt(10, l.getUsuarioRegister());
        ps.executeUpdate();
        return true;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

// Actualizar un libro
public boolean actualizar(Libro l) {
    String sql = "UPDATE LIBROS SET ISBN=?, TIPO_LIBRO=?, TITULO=?, AUTOR=?, EDITORIAL=?, ANIO_PUBLICACION=?, CANTIDAD=?, CATEGORIA=?, FECHA_REGISTRO=?, USUARIO_REGISTER=? WHERE ID_LIBRO=?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, l.getIsbn());
        ps.setInt(2, l.getTipoLibro());
        ps.setString(3, l.getTitulo());
        ps.setString(4, l.getAutor());
        ps.setString(5, l.getEditorial());
        ps.setDate(6, new java.sql.Date(l.getAnioPublicacion().getTime()));
        ps.setInt(7, l.getCantidad());
        ps.setString(8, l.getCategoria());
        ps.setTimestamp(9, new java.sql.Timestamp(l.getFechaRegistro().getTime()));
        ps.setInt(10, l.getUsuarioRegister());
        ps.setInt(11, l.getId());
        ps.executeUpdate();
        return true;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

// Eliminar un libro
public boolean eliminar(int id) {
    String sql = "DELETE FROM LIBROS WHERE ID_LIBRO=?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        return true;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
//BUSQUEDA
public List<Libro> buscar(String filtro) {
    List<Libro> lista = new ArrayList<>();
    String sql = "SELECT * FROM libros WHERE titulo LIKE ? OR autor LIKE ? OR isbn LIKE ?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + filtro + "%");
        ps.setString(2, "%" + filtro + "%");
        ps.setString(3, "%" + filtro + "%");
        rs = ps.executeQuery();
        while (rs.next()) {
            Libro l = new Libro();
            l.setId(rs.getInt("ID_LIBRO"));
            l.setIsbn(rs.getString("ISBN"));
            l.setTipoLibro(rs.getInt("TIPO_LIBRO"));
            l.setTitulo(rs.getString("TITULO"));
            l.setAutor(rs.getString("AUTOR"));
            l.setEditorial(rs.getString("EDITORIAL"));
            l.setAnioPublicacion(rs.getDate("ANIO_PUBLICACION"));
            l.setCategoria(rs.getString("CATEGORIA"));
            l.setCantidad(rs.getInt("CANTIDAD"));
            lista.add(l);
        }
    } catch (Exception e) {
        System.out.println("Error en buscar(): " + e.getMessage());
        e.printStackTrace();
    }
    return lista;
}


}
