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

BEGIN
  
  crearLista(nodoI);
	
END.

