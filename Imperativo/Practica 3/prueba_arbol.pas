program prueba_arbol;

type
	
	nodo = ^datos;
	
	datos = record
		id : integer;
		HI     : nodo;
		HD     : nodo;
	end;

procedure leerDatos(var id:integer);
begin
	write('Ingrese un numero: '); readln(id);
end;

procedure agregarNodo(var a : nodo; id : integer);
begin
	if (a = nil) then begin
		new(a); a^.HI := nil; a^.HD := nil;
		a^.id := id;
	end
	else begin
		if (id >= a^.id) then agregarNodo(a^.HD, id)
		else agregarNodo(a^.HI, id);
	end;
end;

procedure enOrden(a : nodo);
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		writeln(a^.id);
		enOrden(a^.HD);
	end;	
end;

var
	id    : integer; 
	arbol : nodo;

BEGIN
	arbol := nil;
	leerDatos(id);
	while (id <> 0) do begin
		agregarNodo(arbol, id);
		leerDatos(id);
	end;
	enOrden(arbol);
END.

