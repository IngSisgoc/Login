
package modelo;

public class Alerta {
    private String usuario;
    private String libro;
    private String fechaVencimiento;
    private int diasRestantes;

    public Alerta(String usuario, String libro, String fechaVencimiento, int diasRestantes) {
        this.usuario = usuario;
        this.libro = libro;
        this.fechaVencimiento = fechaVencimiento;
        this.diasRestantes = diasRestantes;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getLibro() {
        return libro;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public int getDiasRestantes() {
        return diasRestantes;
    }
}
