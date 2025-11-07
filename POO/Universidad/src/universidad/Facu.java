/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package universidad;

public class Facu {
    private boolean debug = true;
    
    private int maxExamenes;
    private int maxAlumnos;
    private int dimL = 0;
    private Alumno[] alumnos;  
    

    public Facu(int maxExamenes, int maxAlumnos, boolean debug) {
        this.debug = debug;
        this.maxExamenes = maxExamenes;
        this.maxAlumnos = maxAlumnos;
        this.inicializarAlumnos();             
    }

    public int getMaxExamenes() {
        return maxExamenes;
    }

    private void inicializarAlumnos() {
        this.alumnos = new Alumno[this.maxExamenes];        
    }
    
    private int getPosicionAlumno(int legajo) {
       for (int i= 0; i < this.dimL; i++) {
           if (this.alumnos[i].getLegajo() == legajo ) {
               return i;
           }
       }
       return -1;
    }
    
    public void agregarAlumno(String nombre, String apellido, int legajo) {
        
        Alumno nuevo_alumno = new Alumno(nombre, apellido, legajo, this.maxExamenes);
        this.alumnos[this.dimL] = nuevo_alumno;
        this.dimL++;
    
    }
    
    public boolean agregarExamenRendido(int legajo, int mes, int anio, double calificacion, String modalidad) {
        int pos_alumno = this.getPosicionAlumno(legajo);
        if (pos_alumno != -1) {
            this.alumnos[pos_alumno].agregarExamen(mes, anio, calificacion, modalidad);
            if (debug) System.out.println("Examen agregado\n");
            return true;
        }
        if (debug) System.out.println("El alumno no existe\n");
        return false;
    }
 
    public String obtenerMejorPromedio() {
        
        int pos_mejor = -1;
        double mejor_promedio = -1;
        
        if (dimL == 0) return "La facultad no tiene alumnos\n";
        
        for (int i=0; i < dimL; i++) {
           double promedio_alumno = alumnos[i].calcularPromedio();
            if (promedio_alumno > mejor_promedio) {
                pos_mejor = i; mejor_promedio = promedio_alumno;
            }
            
        }
        
        return "ALUMNO CON MEJOR PROMEDIO: \n" + alumnos[pos_mejor].toString() + "\n";
    }    
    
    public int obtenerCantidadExamenes(int mes, int anio ,String modalidad) {
        int conteo = 0;          
        for (int i=0; i < dimL; i++) {
            int aux = alumnos[i].calcularExamenesRendidos(mes, anio, modalidad);
            if (debug) System.out.println(alumnos[i].getNombre() + " | Conteo -> " + aux);
            conteo += aux;            
        }
        return conteo;
    }

    @Override
    public String toString() {
        String retorno = "\n";

        for (int i= 0; i < this.dimL; i++) {
            retorno += this.alumnos[i].toString() + "\n\n";
        }

        return retorno;
        
    }
    
}
