package parcial_julio;


public class Agencia {
    final int MAX_APUESTAS = 100;
    final int MAX_PARTIDOS = 20;
    
    Partido[] partidos;
    Apuesta[] apuestas;
    
    int dimLPartidos;
    int dimLApuestas;

    public Agencia() {
        inicializarVectores();
    }
    
    private void inicializarVectores() {
        partidos = new Partido[MAX_PARTIDOS];
        dimLPartidos = 0;
        
        apuestas = new Apuesta[MAX_APUESTAS];
        dimLApuestas = 0;
    }
    
    public int agregarPartido(Partido nuevo){
        if (dimLPartidos < MAX_PARTIDOS){
            partidos[dimLPartidos] = nuevo;
            dimLPartidos++;
        }
        return dimLPartidos;
    }
    
    public void agregarApuesta(Apuesta nueva){
        if (dimLApuestas < MAX_APUESTAS){
            apuestas[dimLApuestas] = nueva;
            dimLApuestas++;
        }
    }
    
    public boolean agregarResultado(String resultado, int id_partido){
        if (id_partido <= dimLPartidos){
            int pos_partido = id_partido - 1;
            partidos[pos_partido].setResultado(resultado);
            return true;
        }
        return false;
    }
    
    private String chequearApuesta(Apuesta apuesta){
        String retorno = "";

        Partido partido = partidos[apuesta.getIdPartido() - 1];
        String resultado = partido.getResultado();
        String apuesta_ = apuesta.getApuesta();    
                
        if(resultado.equals(apuesta_)){
            double montoGanado = 0;
            switch (resultado) {
                case "victoria local":
                    montoGanado = apuesta.getMonto() * partido.getFactorVictoriaLocal();
                    break;
                case "victoria visitante":
                    montoGanado = apuesta.getMonto() * partido.getFactorVictoriaVisitante();
                    break;
                case "empate":
                    montoGanado = apuesta.getMonto() * partido.getFactorEmpate();
                    break;
            }
            retorno += "\nAPUESTA ACERTADA\n";
            retorno += "- ID partido: " + apuesta.getIdPartido() +"\n";
            retorno += "- Apuesta: " + apuesta.getApuesta()+"\n";
            retorno += "- Nombre: " + apuesta.getNombre() +"\n";
            retorno += "- DNI: " + apuesta.getDni() +"\n";
            retorno += "- Monto ganado: " + montoGanado +"\n";
        }
        
        return retorno;
               
    }
    
    public String cerrarApuestas(){
        String retorno = "";
        for (int i = 0; i < dimLApuestas; i++){
            System.out.println("cerrarApuestas");
            retorno += chequearApuesta(apuestas[i]);            
        }
        return retorno;
    }
    
    public void resetearPartidosYApuestas(){
        dimLPartidos = 0;
        dimLApuestas = 0;        
    }
}
