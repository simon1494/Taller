/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_octubre;

/**
 *
 * @author simon
 */
public class Empresa {
    final int RUBROS = 10;
    final int MAX_POLIZAS = 200;
    Poliza[][] polizas;
    int[] dimensionesL;
    

    public Empresa() {
        instanciarMatrizPolizas();
    }

    private void instanciarMatrizPolizas() {
        polizas = new Poliza[RUBROS][MAX_POLIZAS];
        dimensionesL = new int[RUBROS];
        
        for (int i=1; i < RUBROS; i++) {
            dimensionesL[i] = 0;
        }
    }
    
    public void agregarPoliza(Poliza poliza, int unRubro) {
        int dimL = dimensionesL[unRubro];
        
        if (dimL < MAX_POLIZAS) {
            polizas[unRubro][dimL] = poliza;
            dimensionesL[unRubro] = dimensionesL[unRubro] +1 ;
        }

    }
    
    
    public String infoCliente(int unDni) {
        String retorno = "";
        
        for (int i=0; i < RUBROS; i++) {
            for (int j=0; j < dimensionesL[i]; j++) {
                if (polizas[i][j].getCliente().getDni() == unDni) {
                    retorno += "INFO POLIZA - RUBRO " + i + "\n";
                    retorno += polizas[i][j].toString() + "\n";
                }
            }
        }
       return retorno;
    }
    
    public void aumentarCuotas(double unPorcentaje, int unRubro) {
        for (int j=0; j < dimensionesL[unRubro]; j++) {
            double antigua = polizas[unRubro][j].getValorCuota();
            double aumento = antigua * unPorcentaje / 100;
            polizas[unRubro][j].setValorCuota(antigua + aumento);
        }
    }
    
    public int cantidadAVencer(int mes, int anio) {
        int conteo = 0;
        
        for (int i=0; i < RUBROS; i++) {
            for (int j=0; j < dimensionesL[i]; j++) {
                if (polizas[i][j].getCoberturaFin().getMes() == mes &&
                    polizas[i][j].getCoberturaFin().getAnio() == anio
                    ) {
                        conteo++;
                }
            }
        }
        return conteo;
    }
}
