program p4ej3;

{
Implementar un programa modularizado para una librería. 
Implementar módulos para:

a. Almacenar los productos vendidos en una estructura eficiente para 
la búsqueda por código de producto. De cada producto deben quedar
almacenados su código, la cantidad total de unidades vendidas 
y el monto total. De cada venta se lee código de venta, código del 
producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el código de producto con mayor cantidad de unidades
vendidas.

d. Retornar la cantidad de códigos que existen en el árbol que son
menores que un valor que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos 
comprendidos entre dos valores recibidos (sin incluir) como parámetros.  
}

type

	nodo = ^producto;
	
	producto = record
		cod_prod    : integer;
		vendidos    : integer;
		monto_total : real;
		HI          : nodo;
		HD          : nodo;
	end;

	venta = record
		cod_venta  : integer;
		cod_prod   : integer;
		cant       : integer;
		precio_uni : real;
	end;
	

procedure leerVenta(var v : venta);
begin
	write('Ingrese codigo de venta: '); readln(v.cod_venta);
	write('Ingrese codigo de producto: '); readln(v.cod_prod);
	write('Ingrese cantidad vendida: '); readln(v.cant);
	write('Ingrese prec. unit. del producto: '); readln(v.precio_uni);
end;

function buscarProducto(a : nodo; cod_prod : integer) : nodo;
begin
	if (a = nil) then buscarProducto := nil
	else begin
		if (cod_prod = a^.cod_prod) then buscarProducto := a
		else begin
			if (cod_prod > a^.cod_prod) then buscarProducto := buscarProducto(a^.HD, cod_prod)
			else buscarProducto := buscarProducto(a^.HI, cod_prod);
		end;
	end;
end;

function calcularMontoTotal(v : venta) : real;
begin
	calcularMontoTotal := (v.cant * v.precio_uni);
end;

procedure sumarVenta(var a : nodo; v : venta);
begin
	a^.vendidos := a^.vendidos + v.cant;
	a^.monto_total := a^.monto_total + calcularMontoTotal(v);
end;

procedure agregarProducto(var a : nodo; v : venta);
begin
	if (a = nil) then begin
		new(a); a^.HI := nil; a^.HD:= nil;
		a^.cod_prod := v.cod_prod; 
		a^.vendidos := 0; 
		a^.monto_total := 0;
		a^.HI := nil;
		a^.HD := nil;
		sumarVenta(a, v);
	end
	else begin
		if (v.cod_prod = a^.cod_prod) then sumarVenta(a, v)
		else begin
			if (v.cod_prod < a^.cod_prod) then agregarProducto(a^.HI, v)
			else agregarProducto(a^.HD, v);
		end;
	end;
end;

procedure enOrden(a : nodo);
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		write(a^.cod_prod); write(' - Vendidos: ');
		write(a^.vendidos); write(' - Monto: '); writeln(a^.monto_total:0:2);
		enOrden(a^.HD);
	end;
end;

var
	arbol    : nodo;
	v        : venta; 

BEGIN

	arbol := nil;
	leerVenta(v);
	while (v.cod_venta <> -1) do begin
		agregarProducto(arbol, v);
		leerVenta(v);
	end;
	
	enOrden(arbol);
END.

