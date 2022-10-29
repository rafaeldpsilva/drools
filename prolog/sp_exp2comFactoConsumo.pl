% Vers�o preparada para lidar com regras que contenham nega��o (nao)
% Metaconhecimento
% Usar base de conhecimento veIculos2.txt
% Explica��es como?(how?) e porque n�o?(whynot?)

:-op(220,xfx,entao).
:-op(35,xfy,se).
:-op(240,fx,regra).
:-op(500,fy,nao).
:-op(600,xfy,e).

:-dynamic justifica/3, ratio/2.


carrega_bc:-
		write('KNOWLEDGE BASE NAME (end with .)-> '),
		read(NBC),
		consult(NBC).

tenergai:-calculos, arranca_motor.

calculos:- cria_facto_consumo,
			calcular_ratio,
			check_expensive_hour,
			calcular_excess.

check_expensive_hour:-retract(ultimo_facto(X1)),write(nl),write(X1),
	X is X1+1,
	asserta(ultimo_facto(X)),
	assertz(facto(X,(expensive_hour(this_period,1)))). 	

calcular_excess:-retract(ultimo_facto(X1)),write(nl),write(X1),
	X is X1+1,
	facto(_,production(_,Prod)),
	facto(_,facto_total_consumo(TotalConsum)),
	Excess is Prod - TotalConsum,
	Excess > 0,
	asserta(ultimo_facto(X)),
	assertz(facto(X,(excess(this_period,Excess)))).
	
calcular_ratio:-retract(ultimo_facto(X1)),write(nl),write(X1),
	X is X1+1,
	facto(_,production(_,Prod)),
	facto(_,facto_total_consumo(TotalConsum)),
	Ratio is Prod / TotalConsum,
	asserta(ultimo_facto(X)),
	assertz(facto(X,(ratio(this_period,Ratio)))).

arranca_motor:-
	facto(N,Facto),
		facto_dispara_regras1(Facto, LRegras),
		dispara_regras(N, Facto, LRegras),
		ultimo_facto(N).

cria_facto_consumo:-findall(X,facto(_,device(_,X)),LR),write(nl), write(LR),!,calcula_consumo(LR,T),write(nl),write(T),retract(ultimo_facto(N1)),write(nl),write(N1),
	N is N1+1,
	asserta(ultimo_facto(N)),assertz(facto(N,(facto_total_consumo(T)))).

calcula_consumo([],0):-!.
calcula_consumo([H|T],R):-calcula_consumo(T,R1), R is H + R1.

facto_dispara_regras1(Facto, LRegras):-
	facto_dispara_regras(Facto, LRegras),!.
facto_dispara_regras1(_, []).
% Caso em que o facto n�o origina o disparo de qualquer regra.

dispara_regras(N, Facto, [ID|LRegras]):-
	regra ID se LHS entao RHS,
	facto_esta_numa_condicao(Facto,LHS),
	% Instancia Facto em LHS
	verifica_condicoes(LHS, LFactos),
	member(N,LFactos),
	concluir(RHS,ID,LFactos),
	!,
	dispara_regras(N, Facto, LRegras).

dispara_regras(N, Facto, [_|LRegras]):-
	dispara_regras(N, Facto, LRegras).

dispara_regras(_, _, []).


facto_esta_numa_condicao(F,[F  e _]).

facto_esta_numa_condicao(F,[avalia(F1)  e _]):- F=..[H,H1|_],F1=..[H,H1|_].

facto_esta_numa_condicao(F,[_ e Fs]):- facto_esta_numa_condicao(F,[Fs]).

facto_esta_numa_condicao(F,[F]).

facto_esta_numa_condicao(F,[avalia(F1)]):-F=..[H,H1|_],F1=..[H,H1|_].


verifica_condicoes([nao avalia(X) e Y],[nao X|LF]):- !,
	\+ avalia(_,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([avalia(X) e Y],[N|LF]):- !,
	avalia(N,X),
	verifica_condicoes([Y],LF).

verifica_condicoes([nao avalia(X)],[nao X]):- !, \+ avalia(_,X).
verifica_condicoes([avalia(X)],[N]):- !, avalia(N,X).

verifica_condicoes([nao X e Y],[nao X|LF]):- !,
	\+ facto(_,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([X e Y],[N|LF]):- !,
	facto(N,X),
	verifica_condicoes([Y],LF).

verifica_condicoes([nao X],[nao X]):- !, \+ facto(_,X).
verifica_condicoes([X],[N]):- facto(N,X).



concluir([cria_facto(F)|Y],ID,LFactos):-
	!,
	cria_facto(F,ID,LFactos),
	concluir(Y,ID,LFactos).

concluir([],_,_):-!.



cria_facto(F,_,_):-
	facto(_,F),!.

cria_facto(F,ID,LFactos):-
	retract(ultimo_facto(N1)),
	N is N1+1,
	asserta(ultimo_facto(N)),
	assertz(justifica(N,ID,LFactos)),
	assertz(facto(N,F)),
	write('Following fact was concluded  '),write(N),write(' -> '),write(F),get0(_),!.



avalia(N,P):-	P=..[Functor,Entidade,Operando,Valor],
		P1=..[Functor,Entidade,Valor1],
		facto(N,P1),
		compara(Valor1,Operando,Valor).

compara(V1,==,V):- V1==V.
compara(V1,\==,V):- V1\==V.
compara(V1,>,V):-V1>V.
compara(V1,<,V):-V1<V.
compara(V1,>=,V):-V1>=V.
compara(V1,=<,V):-V1=<V.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualiza��o da base de factos

mostra_factos:-
	findall(N, facto(N, _), LFactos),
	escreve_factos(LFactos).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gera��o de explica��es do tipo "Como"

como(N):-ultimo_facto(Last),Last<N,!,
	write('This conclusion wasnt reached'),nl,nl.
como(N):-justifica(N,ID,LFactos),!,
	facto(N,F),
	write('Concludes the fact number '),write(N),write(' -> '),write(F),nl,
	write('by rule '),write(ID),nl,
	write('because it verified that '),nl,
	escreve_factos(LFactos),
	write('********************************************************'),nl,
	explica(LFactos).
como(N):-facto(N,F),
	write('Fact number '),write(N),write(' -> '),write(F),nl,
	write('was initially known'),nl,
	write('********************************************************'),nl.


escreve_factos([I|R]):-facto(I,F), !,
	write('Fact number '),write(I),write(' -> '),write(F),write(' is true'),nl,
	escreve_factos(R).
escreve_factos([I|R]):-
	write('The condition '),write(I),write(' is true'),nl,
	escreve_factos(R).
escreve_factos([]).

explica([I|R]):- \+ integer(I),!,explica(R).
explica([I|R]):-como(I),
		explica(R).
explica([]):-	write('********************************************************'),nl.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gera��o de explica��es do tipo "Porque nao"
% Exemplo: ?- whynot(classe(meu_ve�culo,ligeiro)).

whynot(Facto):-
	whynot(Facto,1).

whynot(Facto,_):-
	facto(_, Facto),
	!,
	write('The fact '),write(Facto),write(' is not false!'),nl.
whynot(Facto,Nivel):-
	encontra_regras_whynot(Facto,LLPF),
	whynot1(LLPF,Nivel).
whynot(nao Facto,Nivel):-
	formata(Nivel),write('Because:'),write(' The fact '),write(Facto),
	write(' is true'),nl.
whynot(Facto,Nivel):-
	formata(Nivel),write('Because:'),write(' The fact '),write(Facto),
	write(' isnt defined in the knowledge base'),nl.

%  As explica��es do whynot(Facto) devem considerar todas as regras que poderiam dar origem a conclus�o relativa ao facto Facto

encontra_regras_whynot(Facto,LLPF):-
	findall((ID,LPF),
		(
		regra ID se LHS entao RHS,
		member(cria_facto(Facto),RHS),
		encontra_premissas_falsas(LHS,LPF),
		LPF \== []
		),
		LLPF).

whynot1([],_).
whynot1([(ID,LPF)|LLPF],Nivel):-
	formata(Nivel),write('Because by the rule '),write(ID),write(':'),nl,
	Nivel1 is Nivel+1,
	explica_porque_nao(LPF,Nivel1),
	whynot1(LLPF,Nivel).

encontra_premissas_falsas([nao X e Y], LPF):-
	verifica_condicoes([nao X], _),
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([X e Y], LPF):-
	verifica_condicoes([X], _),
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([nao X], []):-
	verifica_condicoes([nao X], _),
	!.
encontra_premissas_falsas([X], []):-
	verifica_condicoes([X], _),
	!.
encontra_premissas_falsas([nao X e Y], [nao X|LPF]):-
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([X e Y], [X|LPF]):-
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([nao X], [nao X]):-!.
encontra_premissas_falsas([X], [X]).
encontra_premissas_falsas([]).

explica_porque_nao([],_).
explica_porque_nao([nao avalia(X)|LPF],Nivel):-
	!,
	formata(Nivel),write('The condition is '),write(X),write(' not false'),nl,
	explica_porque_nao(LPF,Nivel).
explica_porque_nao([avalia(X)|LPF],Nivel):-
	!,
	formata(Nivel),write('The condition '),write(X),write(' is  false'),nl,
	explica_porque_nao(LPF,Nivel).
explica_porque_nao([P|LPF],Nivel):-
	formata(Nivel),write('The premise '),write(P),write(' is false'),nl,
	Nivel1 is Nivel+1,
	whynot(P,Nivel1),
	explica_porque_nao(LPF,Nivel).

formata(Nivel):-
	Esp is (Nivel-1)*5, tab(Esp).

% shift_load(L):-
% 	cria_facto_consumo(C),
% 	facto(_,production(_,P)),
% 	E is P-C,
% 	E>0,
% 	combine(E,L1), flatten(L1,L).
	

% cria_facto_consumo(T):-findall(X,(facto(_,device(N,X)), facto(_,(N,1))),LR),calcula_consumo(LR,T),write('consumo\n'),write(T).

% calcula_consumo([],0):-!.
% calcula_consumo([H|T],R):-calcula_consumo(T,R1), R is H + R1.

% combine(E, LR):-findall(device(N,C),(facto(_,device(N,C)), facto(_,connected(N,0))),D),makecombinations(D,E,LR),devices(D1),write('LR'), write(LR), write('D1'),write(D1),checkOneOne(LR,D1,LR1).

% makecombinations([], _,[]).
% makecombinations([H|T], E,[R|X]):-E1 is E, combinations([H|T],E1,R), makecombinations(T,E,X).
% combinations(_,0, []):-!.
% combinations([],_, []):-!.
% combinations([device(N,X)|T],E, [device(N,X)|R]):-E>0, E1 is E-X, E1>=0, combinations(T,E1,R).
% checkOneOne(LR,[], LR):-!.
% checkOneOne(LR,[H|T],L):-member(H,LR),checkOneOne(LR,T,L).
% checkOneOne(LR,[H|T], [H|L]):-checkOneOne(LR,T,L).
% devices(D):-findall([device(N,C)],(facto(_,device(N,C)), facto(_,connected(N,0))),D).
