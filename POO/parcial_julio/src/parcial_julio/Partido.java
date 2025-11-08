package parcial_julio;


public class Partido {
   private String equipoLocal;
   private String equipoVisitante;
   private String resultado = "";
   
   private double factorVictoriaLocal;
   private double factorEmpate;
   private double factorVictoriaVisitante;

    public Partido(String equipoLocal, String equipoVisitante, double factorVictoriaLocal, double factorEmpate, double factorVictoriaVisitante) {
        this.equipoLocal = equipoLocal;
        this.equipoVisitante = equipoVisitante;
        this.factorVictoriaLocal = factorVictoriaLocal;
        this.factorEmpate = factorEmpate;
        this.factorVictoriaVisitante = factorVictoriaVisitante;
    }

    public String getEquipoLocal() {
        return equipoLocal;
    }

    public void setEquipoLocal(String equipoLocal) {
        this.equipoLocal = equipoLocal;
    }

    public String getEquipoVisitante() {
        return equipoVisitante;
    }

    public void setEquipoVisitante(String equipoVisitante) {
        this.equipoVisitante = equipoVisitante;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public double getFactorVictoriaLocal() {
        return factorVictoriaLocal;
    }

    public void setFactorVictoriaLocal(double factorVictoriaLocal) {
        this.factorVictoriaLocal = factorVictoriaLocal;
    }

    public double getFactorEmpate() {
        return factorEmpate;
    }

    public void setFactorEmpate(double factorEmpate) {
        this.factorEmpate = factorEmpate;
    }

    public double getFactorVictoriaVisitante() {
        return factorVictoriaVisitante;
    }

    public void setFactorVictoriaVisitante(double factorVictoriaVisitante) {
        this.factorVictoriaVisitante = factorVictoriaVisitante;
    }
   
   
   
}
