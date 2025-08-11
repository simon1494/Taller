program examen_imperativo_0;

type
	nodo_arbol = ^emisor_arbol;
	
	nodo_lista = ^emisor_lista;
	
	info_emisor = record
		dni        : longint;
		suma_pesos : real;
		paq_env    : integer;
	end;
	
	emisor_arbol = record
		info : info_emisor;
		HI   : nodo_arbol;
		HD   : nodo_arbol;
	end;
	
	emisor_lista = record
		info : info_emisor;
		sig  : nodo_lista; 
	end;
		

	paquete = record
		cod        : integer;
		dni_emisor : longint;
		objetos    : integer;
		peso       : real;
	end;
	
procedure leerPaquete(var p: paquete);
begin
	write('Ingrese DNI del emisor: '); readln(p.dni_emisor);
	write('Ingrese cantidad de objetos: '); readln(p.objetos);
	write('Ingrese peso del paquete: '); readln(p.peso);
end;

procedure sumarEnvio(var a: nodo_arbol; p:paquete);
begin
	a^.info.suma_pesos := a^.info.suma_pesos + p.peso;
	a^.info.paq_env := a^.info.paq_env + 1;
end;

procedure agregarHoja(var a: nodo_arbol; p: paquete);
begin
	if (a = nil) then begin
		new(a);
		a^.HI := nil;
		a^.HD := nil;
		writeln(p.dni_emisor);
		a^.info.dni := p.dni_emisor;
		a^.info.suma_pesos := 0;
		a^.info.paq_env := 0;
		sumarEnvio(a,p);
		writeln(a^.info.dni);
	end
	else begin
		if (p.dni_emisor = a^.info.dni) then sumarEnvio(a,p)
		else begin
			if (p.dni_emisor < a^.info.dni) then agregarHoja(a^.HI,p)
			else agregarHoja(a^.HD,p)			
		end;
	end;
	
	
end;

procedure agregarAdelante(var primero: nodo_lista; a: nodo_arbol);
var 
	nuevo: nodo_lista;
begin
	new(nuevo);
	nuevo^.sig := nil;
	nuevo^.info.dni := a^.info.dni;
	nuevo^.info.suma_pesos := a^.info.suma_pesos;
	nuevo^.info.paq_env := a^.info.paq_env;
	
	if (primero = nil) then primero := nuevo
	else begin
		nuevo^.sig := primero;
		primero := nuevo;
	end;
end;

procedure imprimirInfo(a:nodo_arbol);
begin
	writeln('');
	write('DNI emisor: '); writeln(a^.info.dni);
	write('Total peso enviado: '); writeln(a^.info.suma_pesos:0:2);
	write('Total paquetes enviados: '); writeln(a^.info.paq_env);
	writeln(''); 
end;

procedure enOrden(a: nodo_arbol);
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		imprimirInfo(a);
		enOrden(a^.HD);
	end;
end;

procedure generarArbol(var a: nodo_arbol);
var 
	p: paquete;
begin
	writeln(''); write('Ingrese codigo de envio: '); readln(p.cod);
	while (p.cod <> 0) do begin
		leerPaquete(p);
		writeln(p.dni_emisor);
		agregarHoja(a, p);
		writeln(''); write('Ingrese codigo de envio: '); readln(p.cod);
	end;
end;

var
	a: nodo_arbol;
BEGIN
	a := nil;
	generarArbol(a);
	enOrden(a);	
END.

