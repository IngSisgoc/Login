package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO implements Validar {
    
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public int validar (Usuario usu){
        int r=0;
        String sql="Select * from usuarios where correo=? and clave=?";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, usu.getCorreo());
            ps.setString(2, usu.getContraseña());
            rs=ps.executeQuery();
            while (rs.next()){
                r=r+1;
                usu.setCorreo(rs.getString("CORREO"));
                usu.setNombreUsu(rs.getString("NOMBRE"));
               // usu.setContraseña(rs.getString("CORREO"));
                usu.setRol(rs.getString("ROL"));
            }
            if(r==1){
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
        
    }
    
    
    
}
