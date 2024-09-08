//Dupla: Carlos H. A. Weege e Heron Zonta, BSN-27

program listaCidades;

	type
	ptnodo=^el;
	el = record
		dado: string;
		prox: ptnodo;
	end;
	
	var
	l: ptnodo;
	nomeCid: string;
	op: integer;
	
	procedure lerNomeCidade(var nomeDaCidade: string);
	var nomeVerificar: string;
	begin
	
		write('Informe o nome da cidade: ');
		readln(nomeVerificar);
		
		while (nomeVerificar[1]<'A') or (nomeVerificar[1]>'Z') do
		begin
			writeln;
			writeln('Nome inválido. Escreva corretamente com a primeira letra maiúscula.');
			write('Digite novamente: ');
			readln(nomeVerificar);	
		end;
		
		nomeDaCidade:=nomeVerificar;
		
	end;
	
	procedure iniciarLista (var lista: ptnodo);
	begin
		lista:= nil;
	end;
	
	//aux1 e aux2: Utilizadas para auxiliar na busca da posição correta para inserir na lista ordenada.
	//aux novo que será inserido
	//aux1 percorre a lista
	//aux2 referência ao anterior
	procedure inserirLista (var lista: ptnodo;nomeDaCidade: string);
	var aux1, aux2, aux: ptnodo;
	begin
	
		new(aux);
		if aux = nil then
		begin
			writeln('Memória insuficiente.');
			readkey;
		end
		else
		begin
		
			lerNomeCidade(nomeDaCidade);
	 
	 		aux^.dado:=nomeDaCidade;
	 		aux^.prox:=nil;
			
   		aux1 := lista;
    	aux2 := nil;

    	while (aux1 <> nil) and (aux1^.dado < nomeDaCidade) do
    	begin
     	 	aux2 := aux1;
      	aux1 := aux1^.prox;
    	end;

    	if aux2 = nil then
    	begin
      	aux^.prox := lista;
      	lista := aux;
    	end
    		
    	else
    	begin
      	aux2^.prox := aux;
      	aux^.prox := aux1;
    	end;
    		
   	end;
    
 	end;
		
	//aux1 e aux2: Utilizadas para auxiliar na busca da cidade a ser removida da lista.
	//aux1 percorre a lista
	//aux2 referência ao anterior
	procedure removerLista(var lista: ptnodo; nomeDaCidade: string);
	var aux1, aux2: ptnodo;
	begin
	
		if lista = nil then
			writeln('Não é possível: lista VAZIA.')
		
		else
		begin
		
			lerNomeCidade(nomeDaCidade);
		
			aux2:=nil;
			aux1:=lista;
			
			while (aux1<> nil) and (aux1^.dado<>nomeDaCidade) do
			begin
				aux2:=aux1;
				aux1:=aux1^.prox;
			end;
			
			if aux2 = nil then
    		lista := lista^.prox
  		else
    		aux2^.prox := aux1^.prox;
    		
    	dispose(aux1);
    
    end;
    
  end;
	
	procedure exibirLista(lista: ptnodo);
	var
	cont: integer;
	aux: ptnodo;
	begin
		
		if lista = nil then
			writeln('Não é possível exibir: lista VAZIA.')
			
		else
		begin
		
		  cont:=0;
		  
			aux:=lista;
			while aux<>nil do
			begin
				cont:=cont+1;
				writeln(cont,' - ',aux^.dado);
				aux:=aux^.prox;
			end;
			
			writeln('Contagem de cidades inseridas: ',cont);
			
		end;
		
	end;
	
begin

  writeln('=================================================');
  writeln('Algoritmo para criar a LISTA de CIDADES.');
  writeln('=================================================');
  writeln('Presione qualquer tecla para iniciar.');
  readkey;
  clrscr;
  
  iniciarLista(l);

	while op  <> 4 do
	begin
	
		writeln;
    writeln('Operações disponíveis: ');
		writeln; 
    writeln('1. Inserir nova Cidade.');
    writeln('2. Remover uma Cidade já inserida.');
    writeln('3. Exibir a lista de cidades.');
    writeln('4. SAIR do programa.');
    writeln;
    write('Digite o número da operação: ');
  	readln(op);
		
		if op = 1 then
			inserirLista(l,nomeCid)

		else if op = 2 then
			removerLista(l,nomeCid)
			
		else if op = 3 then	
			exibirLista(l);
			
	end;
	
end.