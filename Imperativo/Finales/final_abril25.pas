program final_abril25;


type

	arbol = ^autoA;

	lista = ^autoL;

	auto = record
		patente : String;
		marca   : String;
		anio    : integer;
		valor   : LongInt;
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

procedure mockArbol(var a : arbol);
var v: auto;
begin

	v.patente := 'AA202WX';
	v.marca := 'Renault';
	v.anio := 2016;
	v.valor := 150;
	v.dni := 38017708;
	agregarHoja(a, v);
	
	v.patente := 'BA456IO';
	v.marca := 'Ford';
	v.anio := 2013;
	v.valor := 2000;
	v.dni := 1426598;
	agregarHoja(a, v);
	
	v.patente := 'ASD456';
	v.marca := 'Ford';
	v.anio := 1999;
	v.valor := 40;
	v.dni := 65498712;
	agregarHoja(a, v);
	
	v.patente := 'AA123BB';
	v.marca := 'Chevrolet';
	v.anio := 2011;
	v.valor := 350;
	v.dni := 12345678;
	agregarHoja(a, v);
	
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


procedure enOrdenRango(a : arbol; min : integer; max : integer);
begin
	if a <> nil then begin
		if a^.valor > min then enOrdenRango(a^.HI, min, max);
		if (a^.valor >= min) and (a^.valor <= max) then begin
			writeln();
			write('patente: '); writeln(a^.patente);
			write('marca: '); writeln(a^.marca);
			write('anio: '); writeln(a^.anio);
			write('valor: '); writeln(a^.valor);
			write('dni: '); writeln(a^.dni);
			writeln();
		end;
		if a^.valor < max then enOrdenRango(a^.HD, min, max);
	end;
end;



VAR

	a : arbol;
	min, max : integer;
	
	
BEGIN
	a := nil;
	min := 100;
	max := 1000;
	
	mockArbol(a);
	{cargarArbol(a);}

	writeln('-- EN ORDEN --');
	enOrden(a);	

	writeln('-- EN ORDEN RANGO --');
	enOrdenRango(a, min, max);
	
END.

