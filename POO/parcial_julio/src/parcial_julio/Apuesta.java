package parcial_julio;

public class Apuesta {
    private int idPartido;
    private String nombre;
    private int dni;
    private String apuesta;
    private double monto;

    public Apuesta(int idPartido, String nombre, int dni, String apuesta, double monto) {
        this.idPartido = idPartido;
        this.nombre = nombre;
        this.dni = dni;
        this.apuesta = apuesta;
        this.monto = monto;
    }

    public int getIdPartido() {
        return idPartido;
    }

    public void setIdPartido(int idPartido) {
        this.idPartido = idPartido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getApuesta() {
        return apuesta;
    }

    public void setApuesta(String apuesta) {
        this.apuesta = apuesta;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    


    
    
}
