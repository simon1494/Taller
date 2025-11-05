program final_junio25;


type

	arbol = ^emisorA;

	lista = ^emisorL;
	
	emisorA = record
		dni      : integer;
		suma_cant: integer;
		suma_peso: real;
		HI     : arbol;
		HD     : arbol;
	end;
	
	emisorL = record
		dni      : integer;
		suma_cant: integer;
		suma_peso: real;
		sig     : lista;
	end;

	paquete = record
		cod      : integer;
		dni_emi  : integer;
		dni_rec  : integer;
		peso     : real;
		cant     : integer;
	end;
	
procedure crearPaquete(var p : paquete);
begin	

	write('dni_emi: '); readln(p.dni_emi);
	write('dni_rec: '); readln(p.dni_rec);
	write('peso: '); readln(p.peso);
	write('cant: '); readln(p.cant);
	writeln('---------------------');

end;


function buscarEmisor(a : arbol; dni : integer) : arbol;
begin	
	if a = nil then buscarEmisor := nil
	else if a^.dni = dni then buscarEmisor := a
	else if (dni < a^.dni) then buscarEmisor := buscarEmisor(a^.HI, dni)
	else buscarEmisor := buscarEmisor(a^.HD, dni);
end;

procedure existeEmisor(a : arbol; dni : integer);
var buscado:arbol;
begin	
	buscado := buscarEmisor(a,dni);
	if (buscado <> nil) then begin
		writeln('***********'); 
		write('EMISOR DNI '); writeln(buscado^.dni);
		write('suma_peso: '); writeln(buscado^.suma_peso:0:2);
		write('suma_cant: '); writeln(buscado^.suma_cant);
		writeln('***********'); 
	end
	else writeln('dni no encontrado...');

	
end;

procedure agregarHoja(var a : arbol; p : paquete);
var nuevo:arbol;
begin
	
	new(nuevo);
	nuevo^.dni := p.dni_emi;
	nuevo^.suma_cant := p.cant;
	nuevo^.suma_peso := p.peso;
	nuevo^.HI := nil; nuevo^.HD := nil;
	
	if (a = nil) then a := nuevo
	else
		if (p.dni_emi <= a^.dni) then agregarHoja(a^.HI, p)
		else agregarHoja(a^.HD, p);
	
end;

procedure agregarNodo(var l : lista; e: arbol);
var nuevo:lista;
begin

	new(nuevo);
	nuevo^.dni := e^.dni;
	nuevo^.suma_cant := e^.suma_cant;
	nuevo^.suma_peso := e^.suma_peso;
	nuevo^.sig := nil;
	
	if (l = nil) then l := nuevo
	else begin
		nuevo^.sig := l;
		l := nuevo;
	end;
end;

procedure sumarPaquete(var nodo : arbol; p : paquete);
begin
	nodo^.suma_cant := nodo^.suma_cant + p.cant;
	nodo^.suma_peso := nodo^.suma_peso + p.peso;
end;

procedure cargarArbol(var a : arbol);
var p: paquete; nodoEmisor:arbol;
begin

	write('cod: '); readln(p.cod); 
	
	while (p.cod <> 0) do begin
		crearPaquete(p);
		nodoEmisor := buscarEmisor(a, p.dni_emi);
		
		if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
		else agregarHoja(a, p);
		
		write('cod: '); readln(p.cod); 
	end;
	
end;

procedure enOrden(a : arbol);
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		write('dni: '); writeln(a^.dni);
		write('suma_cant: '); writeln(a^.suma_cant);
		write('suma_peso: '); writeln(a^.suma_peso:0:2);
		writeln('*************');
		enOrden(a^.HD);
	end;
end;

procedure generarLista(a : arbol; var l : lista; v : integer);
begin
	if (a <> nil) then begin
		generarLista(a^.HD, l, v);
		if (a^.suma_cant < v) then agregarNodo(l, a);
		generarLista(a^.HI, l, v);
	end;
end;

procedure imprimirLista(l : lista);
begin
	while (l <> nil) do begin
		write('emisor: '); writeln(l^.dni);
		write('suma_peso: '); writeln(l^.suma_peso:0:2);
		write('suma_cant: '); writeln(l^.suma_cant);
		writeln('*************');
		l := l^.sig;
	end;
end;

procedure generarArbol(var a : arbol);
var p : paquete; nodoEmisor: arbol;
begin

	p.cod := 0;
	p.dni_emi :=  123;
	p.dni_rec := 456;
	p.peso := 52.3;
	p.cant := 2;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
	
	p.cod := 1;
	p.dni_emi :=  456;
	p.dni_rec := 123;
	p.peso := 2.3;
	p.cant := 1;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
		
	p.cod := 2;
	p.dni_emi :=  789;
	p.dni_rec := 456;
	p.peso := 15.9;
	p.cant := 2;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
		
	p.cod := 3;
	p.dni_emi :=  123;
	p.dni_rec := 456;
	p.peso := 10.2;
	p.cant := 3;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
		
	p.cod := 4;
	p.dni_emi :=  741;
	p.dni_rec := 456;
	p.peso := 20;
	p.cant := 7;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
		
	p.cod := 5;
	p.dni_emi :=  1852;
	p.dni_rec := 456;
	p.peso := 10.2;
	p.cant := 3;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
		
	p.cod := 6;
	p.dni_emi :=  123;
	p.dni_rec := 456;
	p.peso := 100.2;
	p.cant := 1;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);
		
	p.cod := 7;
	p.dni_emi := 789;
	p.dni_rec := 456;
	p.peso := 159.6;
	p.cant := 20;
	nodoEmisor := buscarEmisor(a, p.dni_emi);	
	if (nodoEmisor <> nil) then write('oaaa');
	
	if (nodoEmisor <> nil) then sumarPaquete(nodoEmisor, p)
	else agregarHoja(a, p);	
	
end;

procedure buscarEmisores(var a : arbol; l : lista; valor : integer);
begin
end;

VAR
	a     : arbol;
	l     : lista;
	valor : integer;
	
BEGIN

	a     := nil;
	l     := nil;
	valor := 10;
	
	generarArbol(a);
	generarLista(a, l, valor);
	
	writeln();
	writeln('EMISORES EN ARBOL');
	writeln();
	enOrden(a);
	
	writeln();
	write('EMISORES CON CANTIDAD MENOR A '); writeln(valor);
	writeln();
	imprimirLista(l);
	
	writeln();
	existeEmisor(a, 789);
	
	writeln();
	existeEmisor(a, 987);
	
	
END.

