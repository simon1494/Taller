/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package universidad;

public class Alumno {
    private String nombre;
    private String apellido;
    private int legajo;
    private Examen[] examenes;
    private int dimL = 0;
    private int dimF;


    public Alumno(String nombre, String apellido, int legajo, int cantidad_permitida) {
        setNombre(nombre);
        setApellido(apellido);
        setLegajo(legajo);
        
        dimF = cantidad_permitida;
        inicializarExamenes();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getLegajo() {
        return legajo;
    }

    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    
    public Examen[] getExamenes() {
        return examenes;
    }

    private void inicializarExamenes() {
        examenes = new Examen[dimF];
    }
    
    public void agregarExamen(int mes, int anio, double calificacion, String modalidad) {
    
        Examen nuevo = new Examen(mes, anio, calificacion, modalidad);
        examenes[dimL] = nuevo;
        dimL++;
    
    }
    
    public double calcularPromedio() {
        double promedio = 0;
        
        if (dimL == 0) return 0;
        
        for (int i = 0; i < dimL; i++) {
            promedio += examenes[i].getCalificacion();
        }
        
        return promedio / dimL;
    
    }
    
    public int calcularExamenesRendidos(int m, int a, String mod) {
        int conteo = 0;
        
        for (int i=0; i < dimL; i++) {
            if (m == examenes[i].getMes() && 
                a == examenes[i].getAnio()&&
                mod.equals(examenes[i].getModalidad()) )
                conteo += 1;
        }
        
        return conteo;
    
    }
 
    @Override
    public String toString() {
        String retorno = "";
        retorno += "Nombre: " + getNombre() + "\n";
        retorno += "Apellido: " + getApellido() + "\n";
        retorno += "Legajo: " + getLegajo() + "\n";
        retorno += "Examenes rendidos: " + dimL + "\n"; 
        retorno += "Promedio: " + calcularPromedio(); 
        
        
        return retorno;
    }
    
}
