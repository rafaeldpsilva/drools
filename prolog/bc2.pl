:-dynamic facto/2, ultimo_facto/1, ratio/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metaconhecimento

facto_dispara_regras(usertype(individual), [1]).
facto_dispara_regras(ratio(this_period,_), [1,2,3]).
% facto_dispara_regras(usertype(community), [1, 3, 8]).
% facto_dispara_regras(tipo(_, mercadorias), [2, 8]).
% facto_dispara_regras(tipo(_, misto), [4]).
% facto_dispara_regras(lota��o(_, _), [5, 7]).
% facto_dispara_regras(peso(_, _), [6, 7]).
% facto_dispara_regras(classe(_, ligeiro), [1]).
% facto_dispara_regras(classe(_, pesado), [2, 3, 4]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ultimo_facto(21).
ultima_regra(1).


% Ratio superior a 1
regra 1
	se [avalia(ratio(this_period,>,1))]
	entao [cria_facto(ratio_more_than_one(this_period,1))].

% Ratio inferior a 1
regra 2
	se [avalia(ratio(this_period,<=,1))]
	entao [cria_facto(ratio_less_than_one(this_period,1))].

%Ratio igual a 0
regra 3 
    se [avalia(ratio(this_period,=,0))]
	entao [cria_facto(ratio_equals_zero(this_period,1))].


facto(1,solar_radiation(this_period,112)).
facto(2,temperature(this_period,6)).
facto(3,wind_speed(this_period,15)).


%vem pelo write
%device(EV,150).
%has_EV(this_period,1).


%period 1
%weather data

%production
facto(4,production(this_period, 2000)).

%devices
facto(5,device(ac,200)).
facto(6,connected(ac,1)).
facto(7,essential(ac,1)).

facto(8,device(washing_machine,400)).
facto(9,connected(washing_machine,1)).
facto(10,essential(washing_machine,0)).

facto(11,device(dryer,100)).
facto(12,connected(dryer,0)).
facto(13,essential(washing_machine,0)).

facto(14,device(roomba,500)).
facto(15,connected(roomba,0)).
facto(16,essential(roomba,1)).

facto(17,device(microwave,100)).
facto(18,connected(microwave,1)).
facto(19,essential(microwave,1)).

facto(20,energy_price(this_period,0.005)).
facto(21, usertype(individual)).
% facto(21, usertype(community))







