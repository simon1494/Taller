program arboles;

type
  arbol = ^nodo;
  nodo = record
			dato: integer;
			HI: arbol;
			HD: arbol;
		 end;

procedure agregar(var arbolito:arbol; dato: integer);
  begin
    if (arbolito = nil) then 
	  begin
        new(arbolito);
        arbolito^.dato:= dato; 
        arbolito^.HI:=nil; 
        arbolito^.HD:=nil;
      end
    else 
      begin
        if (dato <= arbolito^.dato) then agregar(arbolito^.HI, dato)
        else agregar(arbolito^.HD, dato);
      end;
  end;
  
procedure enOrdenAscendente(a:arbol);
  begin
    if (a <> nil) then
      begin
        enOrdenAscendente(a^.HI);
        writeln(a^.dato);
        enOrdenAscendente(a^.HD);
      end;
    end;	
    
procedure enOrdenDescendente(a:arbol);
  begin
    if (a <> nil) then
      begin
        enOrdenDescendente(a^.HD);
        writeln(a^.dato);
        enOrdenDescendente(a^.HI);
      end;
    end; 
    
procedure preOrden(a:arbol);
  begin
    if (a <> nil) then
      begin
        writeln(a^.dato);
        preOrden(a^.HI);
        preOrden(a^.HD);
      end;
    end;
    
procedure postOrden(a:arbol);
  begin
    if (a <> nil) then
      begin
        postOrden(a^.HI);
        postOrden(a^.HD);
        writeln(a^.dato);
      end;
    end;
    
function buscarItem(a: arbol; item: integer) : boolean;
begin
  if (a = nil) then begin
    buscarItem:=false
  end
  else
    if (a^.dato = item) then buscarItem:= true
    else
      if (a^.dato < item) then buscarItem:=buscarItem(a^.HD, item)
      else buscarItem:=buscarItem(a^.HI, item);
end;
     

procedure buscar(a: arbol; item: integer) : boolean;
  begin
    if (a <> nil) and (item <> a^.dato) then
      begin
        enOrdenAscendente(a^.HI);
        writeln(a^.dato);
        enOrdenAscendente(a^.HD);
      end;
     
    end;

var
  arbolito: arbol;
  numerito: integer;

BEGIN
	read(numerito);
	
	while(numerito <> 0) do
	  begin
	    agregar(arbolito, numerito);
	    read(numerito);
	  end;
	writeln('En orden descendente');
	enOrdenDescendente(arbolito);
	writeln('');
	readln(numerito);
	while(numerito<>0) do
	begin
	  writeln(buscarItem(arbolito, numerito));
	  readln(numerito);
	end;
END.

