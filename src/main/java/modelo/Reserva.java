package modelo;

import java.util.Date;

public class Reserva {

    private int idReserva;
    private int idLibro;
    private int idUsuario;
    private Date fechaReserva;
    private Date fechaDevolucion;
private String estado;
    private String nombreUsuario;
    private String tituloLibro;

    public Reserva() {
    }

    public Reserva(int idReserva, int idLibro, int idUsuario, Date fechaReserva, Date fechaDevolucion, String estado, String nombreUsuario, String tituloLibro) {
        this.idReserva = idReserva;
        this.idLibro = idLibro;
        this.idUsuario = idUsuario;
        this.fechaReserva = fechaReserva;
        this.fechaDevolucion = fechaDevolucion;
        this.estado = estado;
        this.nombreUsuario = nombreUsuario;
        this.tituloLibro = tituloLibro;
    }

    
    
    
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public Date getFechaDevolucion() {
        return fechaDevolucion;
    }

    public void setFechaDevolucion(Date fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getTituloLibro() {
        return tituloLibro;
    }

    public void setTituloLibro(String tituloLibro) {
        this.tituloLibro = tituloLibro;
    }
}
