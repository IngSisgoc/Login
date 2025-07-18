package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public String url = "jdbc:mysql://localhost:3306/biblioteca?serverTimezone=UTC";
    public String user = "root";
    public String password = "";

    private Connection con;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver actualizado
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/biblioteca?serverTimezone=UTC", 
                "root", 
                ""
            );
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
