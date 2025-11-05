program lista;

type
  nodo = ^persona;
  persona = record
			  nombre: string;
			  apellido: string;
			  dni: integer;
			  sig: nodo;
			end;
			  
procedure crearLista(var nodoI: nodo);
  begin
    nodoI := nil;
  end;

var
  nodoI: nodo;
  str1, str2: String;

BEGIN
  
  str1:='buenas';
  str2:='Alo';
  
  if (str1 > str2) then writeln('es verdad')
  else writeln('nope');
	  
	
END.

