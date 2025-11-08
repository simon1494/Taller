/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_octubre;

/**
 *
 * @author simon
 */
public class Poliza {
    private double montoAsegurado;
    private double valorCuota;
    private Fecha coberturaIni;
    private Fecha coberturaFin;
    private Cliente cliente;

    public Poliza(double montoAsegurado, double valorCuota, Fecha coberturaIni, Fecha coberturaFin, Cliente cliente) {
        this.montoAsegurado = montoAsegurado;
        this.valorCuota = valorCuota;
        this.coberturaIni = coberturaIni;
        this.coberturaFin = coberturaFin;
        this.cliente = cliente;
    }

    public double getMontoAsegurado() {
        return montoAsegurado;
    }

    public void setMontoAsegurado(double montoAsegurado) {
        this.montoAsegurado = montoAsegurado;
    }

    public double getValorCuota() {
        return valorCuota;
    }

    public void setValorCuota(double valorCuota) {
        this.valorCuota = valorCuota;
    }

    public Fecha getCoberturaIni() {
        return coberturaIni;
    }

    public void setCoberturaIni(Fecha coberturaIni) {
        this.coberturaIni = coberturaIni;
    }

    public Fecha getCoberturaFin() {
        return coberturaFin;
    }

    public void setCoberturaFin(Fecha coberturaFin) {
        this.coberturaFin = coberturaFin;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public String toString() {
        String retorno = "";
        retorno += "- Monto asegurado: " +getMontoAsegurado() + "\n";
        retorno += "- Valor mensual cuota: " + getValorCuota()+ "\n";
        retorno += "- Inicio cobertura: " +getCoberturaIni().toString()+ "\n";
        retorno += "- Final cobertura: " +getCoberturaFin().toString() + "\n";
        retorno += "- Cliente: " +getCliente().toString()+ "\n";
        
        return retorno;
    }
    
}

