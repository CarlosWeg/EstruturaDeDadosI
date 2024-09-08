program ponteiro;

	type
	ptnodo = ^elemento;
	elemento = record
		dado: integer;
		prox: ptnodo;
	end;
	
	var
	f: ptnodo;
	num,op: integer;
	
	procedure lerElemento(var inf: integer);
	begin
		writeln('Informe o elemento: ');
		readln(inf);
	end;
	
	procedure criarFila(var fila: ptnodo);
	begin
		fila:= nil;
	end;
	
	procedure incluir(var fila:ptnodo; inf: integer);
	var aux, aux2: ptnodo;
	begin
	
		new(aux);
		if aux = nil then
			writeln('Memória CHEIA.')
		
		else
		begin
		
			if fila = nil then
			begin
				aux^.dado:=inf;
				aux^.prox:=fila;
				fila:=aux;
			end
			
			else
			begin
				aux2:=fila;
				while aux2^.prox<>nil do
				 aux2:=aux2^.prox;
        aux^.dado:=inf;
        aux^.prox:=nil;
        aux2^.prox:=aux; 
			end;
			
		end;
		
	end;
		
	procedure remover(var fila: ptnodo);
	var	aux: ptnodo;
	begin
	
		if fila = nil then
			writeln('Fila VAZIA.')
		
		else
		begin
			aux:=fila;
			writeln('Elemento retirado: ',aux^.dado);
			fila:=aux^.prox;
			dispose(aux);
		end;
		
	end;
	
	function contarElementos(fila: ptnodo): integer;
	var
	aux: ptnodo;
	cont: integer;
	begin
	
	  cont:=0;
	  
		if fila<>nil then
		begin
			aux:=fila;
			while aux<> nil do
			begin
				cont:=cont+1;
        writeln(cont,' - ',aux^.dado);
        aux:=aux^.prox;
			end;	
		end;
		
		contarElementos:=cont;
		
	end;
	
begin

	criarFila(f);
	
	while op<>4 do
	begin
	
		writeln ('1-Incluir');
  	writeln ('2-Remover');
    writeln ('3-Contar Elementos');	
		readln(op);
		
		if op = 1 then
		begin
			lerElemento(num);
			incluir(f,num);
		end
		
		else if op = 2 then
			remover(f)
			
		else if op = 3 then
			contarElementos(f);				
	
	end;
	
end.
					
			
		
	
	