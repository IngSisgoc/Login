
package modelo;

public class Usuario {
    private int IdUsuario;
    private String NombreUsu;
    private String Correo;
    private String Contraseña;
    private String Rol;

    public Usuario() {
    }

    public Usuario(int IdUsuario, String NombreUsu, String Correo, String Contraseña, String Rol) {
        this.IdUsuario = IdUsuario;
        this.NombreUsu = NombreUsu;
        this.Correo = Correo;
        this.Contraseña = Contraseña;
        this.Rol = Rol;
    }

    public String getNombreUsu() {
        return NombreUsu;
    }

    public void setNombreUsu(String NombreUsu) {
        this.NombreUsu = NombreUsu;
    }



    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public String getRol() {
        return Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }


    
    
}
