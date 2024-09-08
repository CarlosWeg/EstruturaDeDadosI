program pilha;

	type
	vetor = array [1..4] of integer;
	
	var
	pilha: vetor;
	op,el,posi: integer;
	
	procedure lerElemento(var elemento: integer);
	begin
		writeln('Informe o elemento: ');
		readln(elemento);
	end;
	
	function vazia(posicao: integer):boolean;
	begin
		if posicao = 0 then
			vazia:= true
		else
			vazia:= false
	end;
	
	function cheia(posicao: integer):boolean;
	begin
		if posicao = 4 then
			cheia:= true
		else
			cheia:= false
			
	end;
	
	procedure inserirPilha(var vet: vetor;var elemento, posicao: integer);
	begin
		if cheia(posicao) = false then
		begin
			posicao:=posicao+1;
			lerElemento(elemento);
			vet[posicao]:=elemento;
		end
		
		else writeln('Não foi possível, pilha CHEIA');
	end;
	
	procedure removerPilha(var vet: vetor;var posicao: integer);
	var removido: integer;
	begin
	
		if vazia (posicao) = false then
		begin
			removido:=vet[posicao];
			vet[posicao]:=0;
			posicao:=posicao-1;
			
			writeln('Valor removido da pilha: ',removido);
		end
		else writeln('Não foi possível, pilha VAZIA');
		
	end;
			
	procedure	escreverPilha(vet: vetor;posicao: integer);
	var i: integer;
	begin
		
		if vazia(posicao) = false then
			for i:=posicao downto 1 do
				writeln('|',vet[i])
				
		else writeln('Não foi possível, pilha VAZIA'); 
			
	end;
	
		
	
begin
	
	while op<> 6 do
	begin
	  writeln;
	  writeln('MENU');
		writeln('Digite os respectivos valores para realizar as açoes:');
		writeln('1: Inserir');
		writeln('2: Remover da Pilha');
		writeln('3: verifica se esta vazia');
		writeln('4: Verifica se esta cheia');
		writeln('5: Imprime Pilha');
		writeln('6: Sair do programa');
		readln(op);
		writeln;


		if op = 1 then
			inserirPilha(pilha,el,posi)
		
		else if op = 2 then
			removerPilha(pilha,posi)
			
		else if op = 3 then
			if vazia(posi) = true then
				writeln('A pilha está vazia.')
			else writeln('A pilha NÃO está vazia.')
					
		else if op = 4 then
			if cheia(posi) = true then
				writeln('A pilha está cheia.')
			else writeln('A pilha NÃO está cheia.')
		
		else if op = 5 then
			escreverPilha(pilha,posi);
				
	 end;

end.