//Alunos: Carlos H. A. Weege e Heron Zonta - BSN 27.

program dequeAlocacaoDinamicaDupla;

	type
	
  tipoInfo = integer;

  ptnodo = ^elemento;

  elemento = record
    info: tipoInfo;
    prox: ptnodo;
    anterior: ptnodo;
  end;

  deque = record
    inicio, fim: ptnodo;
  end;

	var
  op: byte;
  el: tipoInfo;
  d: deque;

	procedure iniciarDeque(var d: deque);
	begin
	
  	d.inicio := nil;
  	d.fim := nil;
  	
	end;
	
	procedure leitura(var valor: tipoInfo);
	begin
		
		writeln('Informe o valor: ');
		readln(valor);	
	
	end; 

	procedure inserirInicio(var d: deque; valor: tipoInfo);
	var aux: ptnodo;
	begin
	
		new(aux);
		if aux = nil then
  	begin
    	writeln('Memória insuficiente.');
    	readkey;
  	end
  	
  	else
  	begin
  	
  		leitura(valor);
  		
    	aux^.info := valor;
    	aux^.prox := d.inicio;
    	aux^.anterior := nil;

    	if d.inicio = nil then
      	d.fim := aux
    	else
      	d.inicio^.anterior := aux;

    	d.inicio := aux;
    	
  	end;
  	
	end;

	procedure inserirFim(var d: deque; valor: tipoInfo);
	var aux: ptnodo;
	begin
	
  	new(aux);
  	if aux = nil then
    	writeln('Memória insuficiente.')
    	
    else
  	begin
  	
  		leitura(valor);
  	
    	aux^.info := valor;
    	aux^.prox := nil;
    	aux^.anterior := d.fim;

    	if d.fim = nil then
      	d.inicio := aux
    	else
      	d.fim^.prox := aux;

    	d.fim := aux;
    	
  	end;
	end;

	procedure removerInicio(var d: deque);
	var aux: ptnodo;
	begin
	
  	if d.inicio = nil then
    	writeln('Não é possível remover: deque VAZIO.')
    	
  	else
  	begin
  	
    	aux := d.inicio;
    	d.inicio := aux^.prox;

    	if d.inicio = nil then
      	d.fim := nil
    	else
      	d.inicio^.anterior := nil;

    	dispose(aux);
    	
    	writeln('Removido com sucesso.');
    	
  	end;
	end;

	procedure removerFim(var d: deque);
	var aux: ptnodo;
	begin
	
  	if d.fim = nil then
    	writeln('Não é possível remover: deque VAZIO.')
    	
  	else
  	begin
  	
    	aux := d.fim;
    	d.fim := aux^.anterior;

    	if d.fim = nil then
      	d.inicio := nil
      	
    	else
      d.fim^.prox := nil;

    	dispose(aux);
    
    	writeln('Removido com sucesso.');
    
  	end;
  	
	end;

	procedure acessoInicio(d: deque);
	var valor: tipoInfo;
	begin
	
  	if d.inicio <> nil then
  	begin
    	valor:=d.inicio^.info;
    	writeln('Valor no início: ', valor);
    end
    	
  	else
    	writeln('Deque VAZIO.');
  	
	end;

	procedure acessoFim(d: deque);
	var valor: tipoInfo;
	begin
	
  	if d.fim <> nil then
  	begin
			valor:=d.fim^.info;
			writeln('Valor no fim: ', valor);
		end
   	 
  	else
    	writeln('Deque VAZIO.');
				
	end;

	function tamanhoDeque(d: deque): integer;
	var
 	aux: ptnodo;
 	cont: integer;
 	begin
 	
  	cont := 0;
 	 	aux := d.inicio;

  	while aux <> nil do
  	begin
    	cont := cont + 1;
    	aux := aux^.prox;
  	end;

  	tamanhoDeque := cont;
  
	end;

	function dequeVazio(d: deque): byte;
	begin
	
		if d.inicio = nil then
  		dequeVazio :=1
  	
  	else
  		dequeVazio:=0;;
  		
	end;

	function dequeCheio(d: deque): byte;
	var
  aux: ptnodo;
	begin
	
  	new(aux);
  	if aux = nil then
    	dequeCheio := 1
    	
  	else
    	dequeCheio := 0;
  	
	end;

begin

	writeln('=================================================');
  writeln('Double Ended Queue - Alocação dinâmica dupla.');
  writeln('=================================================');
  writeln('Pressione qualquer tecla para iniciar.');
  readkey;
  clrscr;

  iniciarDeque(d);
  op:=1;

  while op <> 0 do
  begin
  
    writeln('Operações disponíveis: ');
    writeln('1. Inserir no início.');
    writeln('2. Inserir no final.');
    writeln('3. Remover do início.');
    writeln('4. Remover do final.');
    writeln('5. Acesso ao início.');
    writeln('6. Acesso ao final.');
    writeln('7. Verificar tamanho.');
    writeln('8. Verificar se está vazio.');
    writeln('8. Verificar se está cheio.');
    writeln('0. SAIR do programa.');
    writeln;
    write('Digite o número da operação: ');
    readln(op);
    writeln;

    if op = 1 then
      inserirInicio(d, el)
    
    else if op = 2 then
      inserirFim(d, el) 
    
    else if op = 3 then
			removerInicio(d)
		
		else if op = 4 then
			removerFim(d)
			
    else if op = 5 then
			acessoInicio(d)
    
    else if op = 6 then
			acessoFim(d)
    
    else if op = 7 then
			writeln('Tamanho do deque: ', tamanhoDeque(d))
			
		else if op = 8 then
		begin
		
      if dequeVazio(d) = 1 then
				writeln('Deque está vazio.')
			else
				writeln('Deque não está vazio.');
				
    end
     
		else if op = 9 then
		begin 
		
			if dequeCheio(d) = 1 then
				writeln('Deque está cheio.')
			else
				writeln('Deque não está cheio.');
				
    end;

    writeln;
    
  end;
  
end.