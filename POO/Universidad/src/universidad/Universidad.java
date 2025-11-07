/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package universidad;


public class Universidad {
   
    
    public static void main(String[] args) {
        // El tercer parametro de entrada es un boolean que habilita prints para debuguear
        Facu facultad = new Facu(10, 1000, true);
        System.out.println(facultad.obtenerMejorPromedio());
        
        facultad.agregarAlumno("Simon", "Bierozko", 1);
        facultad.agregarExamenRendido(1, 1, 2025, 10, "Escrito");
        facultad.agregarExamenRendido(1, 12, 2025, 7.5, "Escrito");
        
        
        int aux_mes = 1;
        int aux_anio = 2025;
        String aux_mod = "Escrito";
        System.out.println("\nCantidad de examenes en: " + aux_mes + "/" + aux_anio + " - Modalidad: " + aux_mod);
        System.out.println(facultad.obtenerCantidadExamenes(aux_mes, aux_anio, aux_mod));
        
        System.out.println(facultad.obtenerMejorPromedio());
        
        
        facultad.agregarAlumno("Tomas", "Anderson", 2);
        facultad.agregarExamenRendido(2, 1, 2025, 7, "Escrito");
        facultad.agregarExamenRendido(2, 5, 2025, 10, "Escrito");
        
        aux_mes = 1;
        aux_anio = 2025;
        aux_mod = "Escrito";
        System.out.println("\nCantidad de examenes en: " + aux_mes + "/" + aux_anio + " - Modalidad: " + aux_mod);
        System.out.println(facultad.obtenerCantidadExamenes(aux_mes, aux_anio, aux_mod));
        
        facultad.agregarExamenRendido(2, 5, 2025, 10, "Oral");
        
        aux_mes = 11;
        aux_anio = 2021;
        aux_mod = "Oral";
        System.out.println("\nCantidad de examenes en: " + aux_mes + "/" + aux_anio + " - Modalidad: " + aux_mod);
        System.out.println(facultad.obtenerCantidadExamenes(aux_mes, aux_anio, aux_mod));
   
        facultad.agregarAlumno("Maria", "Pythovka", 3);
        facultad.agregarExamenRendido(3, 1, 2022, 7, "Escrito");
        facultad.agregarExamenRendido(3, 5, 2025, 10, "Escrito");
        facultad.agregarExamenRendido(3, 6, 2023, 7, "Oral");
        facultad.agregarExamenRendido(3, 7, 2025, 10, "Escrito");
        
        
        aux_mes = 5;
        aux_anio = 2025;
        aux_mod = "Escrito";
        System.out.println("\nCantidad de examenes en: " + aux_mes + "/" + aux_anio + " - Modalidad: " + aux_mod);
        System.out.println(facultad.obtenerCantidadExamenes(aux_mes, aux_anio, aux_mod));


        System.out.println(facultad.obtenerMejorPromedio());
        
        System.out.println(facultad.toString());
    }
    
}
