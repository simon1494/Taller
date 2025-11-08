/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial_octubre;

/**
 *
 * @author simon
 */
public class Parcial_octubre {

    public static void main(String[] args) {
        
        Empresa empresa = new Empresa();
        
        Fecha fechaIni = new Fecha(1, 1, 2025);
        Fecha fechaFin = new Fecha(1, 1, 2026);
        Cliente cliente = new Cliente(38017708, "Simon", "Bierozko");
        Poliza poliza1 = new Poliza(100, 10, fechaIni, fechaFin, cliente);
        empresa.agregarPoliza(poliza1, 0);
        
        fechaIni = new Fecha(1, 5, 2025);
        fechaFin = new Fecha(1, 5, 2026);
        cliente = new Cliente(38017708, "Simon", "Bierozko");
        poliza1 = new Poliza(5000, 500, fechaIni, fechaFin, cliente);
        empresa.agregarPoliza(poliza1, 9);
        
        fechaIni = new Fecha(1, 5, 2025);
        fechaFin = new Fecha(1, 5, 2026);
        cliente = new Cliente(123456, "Pedro", "Hernandez");
        poliza1 = new Poliza(4699, 456, fechaIni, fechaFin, cliente);
        empresa.agregarPoliza(poliza1, 3);
        
        fechaIni = new Fecha(8, 11, 2025);
        fechaFin = new Fecha(8, 5, 2028);
        cliente = new Cliente(123456, "Maria", "Sharapova");
        poliza1 = new Poliza(15000, 456, fechaIni, fechaFin, cliente);
        empresa.agregarPoliza(poliza1, 1);
        
        fechaIni = new Fecha(24, 7, 2024);
        fechaFin = new Fecha(30, 5, 2026);
        cliente = new Cliente(456789, "Matias", "Damajuano");
        poliza1 = new Poliza(852, 10, fechaIni, fechaFin, cliente);
        empresa.agregarPoliza(poliza1, 1);
        
        System.out.println(empresa.infoCliente(38017708));
        System.out.println(empresa.infoCliente(123456));
        
        empresa.aumentarCuotas(1.11, 1);
        
        System.out.println(empresa.infoCliente(123456));
        System.out.println(empresa.infoCliente(456789));
        
        int mes = 5;
        int anio = 2026;
        
        System.out.println("Polizas a vencer en " + mes + "/" + anio +" -> " + empresa.cantidadAVencer(mes, anio));
        
    }
    
}
