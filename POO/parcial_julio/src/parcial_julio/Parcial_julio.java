
package parcial_julio;

public class Parcial_julio {

    public static void main(String[] args) {
        Agencia agencia = new Agencia();
        int id_partido;
        int id_partido2;
        
        
        Partido partido = new Partido("River", "Boca", 1.5, 1.3, 1.1);
        id_partido = agencia.agregarPartido(partido);

        Apuesta apuesta = new Apuesta(id_partido, "Simon Bierozko", 38017708, "empate", 100);
        agencia.agregarApuesta(apuesta);
        
        Partido partido2 = new Partido("Racing", "Gimnasia", 1.1, 5, 3);
        id_partido2 = agencia.agregarPartido(partido2);
      
        Apuesta apuesta2 = new Apuesta(id_partido2, "Martin Perez", 14269712, "victoria visitante", 200);
        agencia.agregarApuesta(apuesta2);
        
        agencia.agregarResultado("empate", id_partido);
        agencia.agregarResultado("victoria visitante", id_partido2);
        
        System.out.println(agencia.cerrarApuestas());
            
    }
    
}
