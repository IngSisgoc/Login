package modelo;

import java.util.Date;

public class Libro {

    private int id;
    private String isbn;
    private int tipoLibro;
    private String titulo;
    private String autor;
    private String editorial;
    private Date anioPublicacion;
    private int cantidad;
    private String categoria;
    private Date fechaRegistro;
    private int usuarioRegister;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getTipoLibro() {
        return tipoLibro;
    }

    public void setTipoLibro(int tipoLibro) {
        this.tipoLibro = tipoLibro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public Date getAnioPublicacion() {
        return anioPublicacion;
    }

    public void setAnioPublicacion(Date anioPublicacion) {
        this.anioPublicacion = anioPublicacion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getUsuarioRegister() {
        return usuarioRegister;
    }

    public void setUsuarioRegister(int usuarioRegister) {
        this.usuarioRegister = usuarioRegister;
    }
        public String getTipoLibroTexto() {
        switch (this.tipoLibro) {
            case 1: return "Digital";
            case 2: return "Físico";
            case 3: return "Ambos";
            default: return "Desconocido";
        }
    }
}
