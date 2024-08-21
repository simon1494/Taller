program ProgramaNumAleatorio;

var limInf, limSup, cantidad: integer;


function aleatorioEnRango(limBajo:integer; limAlto:integer): integer;
  var ale:integer;
  begin
	ale:= random(limAlto);
	if (ale < limBajo) then 
	  aleatorioEnRango:= (ale DIV 2) + limBajo
	else
	  aleatorioEnRango:= ale;
  end;
  
  
procedure imprimirAleatorios(limInferior:integer; limSuperior:integer; cuantos:integer);
  var i:integer;
  begin
    for i:=0 to cuantos do begin
      writeln(aleatorioEnRango(limInferior,limSuperior));
    end;
  end;


begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
     write('Ingrese el limite inferior: ');
     readln(limInf);
     
     write('Ingrese el limite superior: ');
     readln(limSup);
     
     write('Ingrese la cantidad de numeros a imprimir: ');
     readln(cantidad);
     
     imprimirAleatorios(limInf, limSup, cantidad);
	
end.
