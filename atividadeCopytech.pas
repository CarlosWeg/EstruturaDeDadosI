//Alunos: Carlos H. A. Weege e Heron Zonta - BSN 27.

program filaAtendimentoCopytech;

	type
	
	tipoInfo = string;
	
	
	infoCliente = record
		nome: tipoInfo;
		prioridade, qntdCopias: integer;
	end;
	
	ptnodo = ^elemento;
	
	elemento = record
		cli: infoCliente;
		prox: ptnodo;
		anterior: ptnodo;
	end;
	
	fila = record
		inicio, fim: ptnodo;
	end;
	
	var
	op, escolhaFila: byte;
	cliente: infoCliente;
	fMono, fColor, fPlotter: fila;
	
	procedure lerCliente (var clienteFila: infoCliente);
	begin
	
		write('Informe o nome do cliente: ');
		readln(clienteFila.nome);
		write('Informe a quantidade de cópias: ');
		readln(clienteFila.qntdCopias);
		
	end;
	
	procedure lerEscolha (var opcao: byte);
	begin
	
	  opcao:=0;
	  
	  while (opcao<1) or (opcao>3) do
	  begin
			writeln('Em qual das filas gostaria de realizar a ação? ');
			writeln('1 - Mono | 2 - Color | 3 - Plotter');
			readln(opcao);
		end;
		
		writeln;
		
	end;
		
	
	procedure iniciar (var f: fila);
	begin
		f.inicio:= nil;
		f.fim:= nil;
	end;
	
	procedure adicionarFila (var f: fila; clienteFila: infoCliente);
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
			
			lerCliente(cliente);
			
			aux^.prox:=nil;
			aux^.anterior:=f.fim;
			aux^.cli:=cliente;
			
			if f.inicio = nil then
				f.inicio:= aux
			
			else
				f.fim^.prox:=aux;
				
			f.fim:=aux;
			
		end;
			
	end;
	
	
	procedure removerFila (var f: fila);
	var aux: ptnodo;
	begin
	
		if f.inicio = nil then
			writeln('Não é possível remover: lista VAZIA.')
			
		else
		begin
				
			aux:=f.inicio;
			
	    f.inicio := aux^.prox;
	    f.inicio^.anterior := nil;
			 
	  end;
	  
	  dispose(aux);
	  
	  writeln('Removido com sucesso.');
	  
	end;
	
	procedure definirPrioridade (var f: fila);
	var
	aux, ant: ptnodo;
	nomePrioridade: tipoInfo;
	begin
	
		if f.inicio = nil then
			writeln('Não é possível definir um cliente como prioridade: lista VAZIA.')
			
		else if f.inicio^.cli.prioridade = 1 then
		begin
			writeln('Não é possível inserir outro cliente como prioridade.');
			writeln('Cliente ',f.inicio^.cli.nome,' já possui prioridade no atendimento.');
		end
		
		else
		begin
		
			write('Informe o nome do cliente: ');
			readln(nomePrioridade);
			
			ant:=nil;
			aux:=f.inicio;
			
			while aux <> nil do
			begin
			
				if aux^.cli.nome = nomePrioridade then
				begin
				
					aux^.cli.prioridade:= 1;
					
					if ant <> nil then
					begin
					
						ant^.prox:= aux^.prox;
						
						if aux^.prox <> nil then
							aux^.prox^.anterior:=ant
						
						else
							f.fim := ant;
						
					end
					
					else
					begin
					
						f.inicio:=aux^.prox;
						
						if f.inicio <> nil then
							f.inicio^.anterior:= nil
						
						else
							f.fim:=nil;
							
					end;
					
					
					aux^.prox := f.inicio;
					aux^.anterior := nil;
					
					if f.inicio <> nil then
						f.inicio^.anterior := aux;
						
					f.inicio:=aux;
					
					writeln('Prioridade concedida com sucesso.');
					exit;
					
				end;
				
				ant:=aux;
				aux:= aux^.prox;
				
			end;
			
			writeln('Nome não encontrado na fila.');
				
		end;
		
	end;
					  
	
	procedure imprimirFila (f: fila);
	var
	cont: byte;
	aux: ptnodo;
	begin
		
		if f.inicio = nil then
			writeln('Não é possível exibir: lista VAZIA.')
		
		else
		begin
		
			cont:=0;
			aux:=f.inicio;
			
			while aux <> nil do
			begin
				cont := cont+1;
				writeln(cont,' - Nome: ',aux^.cli.nome,' - Quantidade de Cópias: ',aux^.cli.qntdCopias);
				aux := aux^.prox;
			end;
			
		end;
		
	end;
	
	
	procedure calcularQntd (f: fila);
	var qntdClientes, qntdCopias: integer;
	aux: ptnodo;
	begin
	
		aux := f.inicio;
		qntdClientes:=0;
		qntdCopias:=0;
		
		while aux <> nil do
		begin
		
			qntdCopias:=qntdCopias+aux^.cli.qntdCopias;
			qntdClientes:=qntdClientes+1;
			
			aux:=aux^.prox;
			
		end;
		
		writeln;
		writeln('Quantidade TOTAL de clientes nesta fila: ',qntdClientes);
		writeln('Quantidade TOTAL de cópias desta fila: ',qntdCopias);
		
	end;
	
begin

  writeln('=================================================');
  writeln('Algoritmo para Gerenciar Filas de Antedimento.');
  writeln('=================================================');
  writeln('Presione qualquer tecla para iniciar.');
  readkey;
  clrscr;
  
  iniciar(fMono);
  iniciar(fColor);
  iniciar(fPlotter);
  
  while op <> 6 do
  begin

  	writeln;
    writeln('Operações disponíveis: ');
		writeln; 
    writeln('1. Inserir em uma das filas.');
    writeln('2. Remover da fila.');
    writeln('3. Definir um cliente como prioridade.');
    writeln('4. Escrever uma das filas.');
    writeln('5. Exibir o total de clientes e de cópias.');
    writeln('6. SAIR do programa.');
    writeln;
    write('Digite o número da operação: ');
  	readln(op);
  	writeln;
		
		//operação 1
		if op = 1 then
		begin
		
			lerEscolha(escolhaFila);
			
			if escolhaFila = 1 then
				adicionarFila(fMono, cliente)
				
			else if escolhaFila = 2 then
				adicionarFila (fColor,cliente)
			
			else if escolhaFila = 3 then
				adicionarFila (fPlotter,cliente)
				
		end
				
		//operação 2
		else if op = 2 then
		begin
		
			lerEscolha(escolhaFila);
			
			if escolhaFila = 1 then
				removerFila(fMono)
				
			else if escolhaFila = 2 then
				removerFila (fColor)
			
			else if escolhaFila = 3 then
				removerFila (fPlotter)
				
		end
		
		//operação 3
		else if op = 3 then
		begin
		
			lerEscolha(escolhaFila);
			
			if escolhaFila = 1 then
				definirPrioridade(fMono)
				
			else if escolhaFila = 2 then
				definirPrioridade (fColor)
			
			else if escolhaFila = 3 then
				definirPrioridade (fPlotter)
				
		end
		
		//operação 4
		else if op = 4 then
		begin
		
			lerEscolha(escolhaFila);
			
			if escolhaFila = 1 then
				imprimirFila (fMono)
				
			else if escolhaFila = 2 then
				imprimirFila (fColor)
			
			else if escolhaFila = 3 then
				imprimirFila (fPlotter)
				
		end
		
		//operação 5
		else if op = 5 then
		begin
		
			lerEscolha(escolhaFila);
			
			if escolhaFila = 1 then
				calcularQntd (fMono)
				
			else if escolhaFila = 2 then
				calcularQntd (fColor)
			
			else if escolhaFila = 3 then
				calcularQntd (fPlotter)
				
		end;
		
		//operação 6 = sair
		
	end;

end.