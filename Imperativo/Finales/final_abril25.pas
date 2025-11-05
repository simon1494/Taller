program final_abril25;


type

	arbol = ^autoA;

	lista = ^autoL;

	auto = record
		patente : String;
		marca   : String;
		anio    : integer;
		valor   : integer;
		dni     : LongInt;
	end;

	autoA = record
		patente : String;
		marca   : String;
		anio    : integer;
		valor   : LongInt;
		dni     : LongInt;
		HI      : arbol;
		HD      : arbol;
	end;
	
	autoL = record
		patente : String;
		marca   : String;
		anio    : integer;
		valor   : LongInt;
		dni     : LongInt;
		sig     : lista
	end;

procedure agregarNuevoLista(var l : lista; a : autoA);
begin
end;

procedure agregarHoja(var a : arbol; v : auto);
var nuevo : arbol;
begin
	new(nuevo);
	nuevo^.patente := v.patente;
	nuevo^.marca := v.marca;
	nuevo^.anio := v.anio;
	nuevo^.valor := v.valor;
	nuevo^.dni := v.dni;
	nuevo^.HI := nil; nuevo^.HD := nil;
	if a = nil then a := nuevo
	else if a^.valor > v.valor then agregarHoja(a^.HI, v)
	else agregarHoja(a^.HD, v);
end;

procedure leerAuto(var v : auto);
begin
	write('marca: '); readln(v.marca);
	write('anio: '); readln(v.anio);
	write('valor: '); readln(v.valor);
	write('dni: '); readln(v.dni);
	writeln();
end;

procedure cargarArbol(var a : arbol);
var v: auto;
begin

	write('patente: '); readln(v.patente);
	while v.patente <> 'ZZZ' do begin
		leerAuto(v);
		agregarHoja(a, v);
		write('patente: '); readln(v.patente);
	end;
end;

procedure enOrden(a : arbol);
begin
	if a <> nil then begin
		enOrden(a^.HI);
		writeln();
		write('patente: '); writeln(a^.patente);
		write('marca: '); writeln(a^.marca);
		write('anio: '); writeln(a^.anio);
		write('valor: '); writeln(a^.valor);
		write('dni: '); writeln(a^.dni);
		writeln();
		enOrden(a^.HD)
	end;
end;


procedure imprimirAutos(a : arbol; min : integer; max : integer);
begin
end;



VAR

	a : arbol;
	
	
BEGIN
	a := nil;
	cargarArbol(a);
	enOrden(a);
	
END.

