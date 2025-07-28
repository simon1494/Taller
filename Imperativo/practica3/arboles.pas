program p3ej3;

type
	nodo = ^alumno;
	lista = ^examen;
	
	alumno = record
		leg: integer;
		examenes: lista;
		HI: nodo;
		HD: nodo;
	end;
	
	examen = record
		cod_materia: integer;
		fecha: string;
		nota: integer;
		sig: lista;
	end;
	
	
	
procedure leerLegajo(var leg : integer);
begin
	write('Ingrese legajo del alumno: '); readln(leg);
end;

procedure leerExamen(var e : examen);
begin
	write('Ingrese codigo de la materia: '); readln(e.cod_materia);
	write('Ingrese fecha de rendido el examen: '); readln(e.fecha);
	write('Ingrese la nota recibida: '); readln(e.nota);
end;

procedure agregarAdelante(var nodoI : lista; e : examen);
var 
	nuevoNodo: lista;
begin
	new(nuevoNodo);
	nuevoNodo^.cod_materia := e.cod_materia;
	nuevoNodo^.fecha := e.fecha;
	nuevoNodo^.nota := e.nota;
	nuevoNodo^.sig := nil;
	
	if (nodoI = nil) then nodoI := nuevoNodo
	else begin
		nuevoNodo^.sig := nodoI;
		nodoI := nuevoNodo;
	end;	
end;

function contarFinalesAprobados(nodoI : lista) : integer;
var
	aprobados : integer;
begin
	aprobados := 0;
	while (nodoI <> nil) do begin
		if (nodoI^.nota >= 4) then aprobados := aprobados + 1;
		nodoI := nodoI^.sig;
	end;
	contarFinalesAprobados := aprobados;
end;

procedure listarFinalesAprobadosPorAlumno(a : nodo);
begin
	if (a <> nil) then begin
		listarFinalesAprobadosPorAlumno(a^.HI);
		write('Alumno '); write(a^.leg); write(' -> ');
		writeln(contarFinalesAprobados(a^.examenes));
		listarFinalesAprobadosPorAlumno(a^.HD);
	end;
end;

function buscarLegajo(n : nodo; leg : integer) : nodo;
begin
	if (n = nil) then buscarLegajo := nil
	else begin
		if (n^.leg = leg) then buscarLegajo := n
		else begin
			if (n^.leg >= leg) then buscarLegajo := buscarLegajo(n^.HI,leg)
			else buscarLegajo := buscarLegajo(n^.HD,leg);
		end;
	end;
end;


procedure agregarNodo(var n : nodo; leg : integer; e : examen);
begin
	if (n = nil) then begin
		new(n);
		n^.leg := leg;
		n^.examenes := nil;
		agregarAdelante(n^.examenes, e);
		n^.HI := nil;
		n^.HD:= nil
	end
	else
		if (leg >= n^.leg) then agregarNodo(n^.HD, leg, e)
		else agregarNodo(n^.HI, leg, e);
end;

function esImpar(numero : integer) : integer;
begin
	if (numero MOD 2 = 0) then esImpar := 0
	else esImpar:= 1;
end;

function alumnosConLegajoImpar(a:nodo) : integer;
begin
	if (a = nil) then alumnosConLegajoImpar := 0
	else begin
		alumnosConLegajoImpar := alumnosConLegajoImpar(a^.HI) +
								 esImpar(a^.leg) + 
								 alumnosConLegajoImpar(a^.HD);
	end;								 
end;

var
	arbolito : nodo;
	leg : integer;
	e : examen;
	nodoAlumno : nodo;
	
BEGIN
	arbolito := nil;
	leerLegajo(leg);
	while (leg <> 0) do begin
		leerExamen(e);
		nodoAlumno := buscarLegajo(arbolito, leg);
		
		if (nodoAlumno <> nil) then agregarAdelante(nodoAlumno^.examenes, e)
		else agregarNodo(arbolito, leg, e);
		
		leerLegajo(leg);
	end;
	
	listarFinalesAprobadosPorAlumno(arbolito);
END.

