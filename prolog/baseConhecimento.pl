:-dynamic facto/2, ultimo_facto/1, ratio/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metaconhecimento

facto_dispara_regras(usertype(individual), [1,2,3]).
facto_dispara_regras(ratio(this_period,_), [1,2,3,24,25]).
facto_dispara_regras(ratio_more_than_one(this_period,_), [4,14,15]).
facto_dispara_regras(predicted_scarcity(this_period,_), [4,14,15,18,21,22,26,29,32,33]).
facto_dispara_regras(shift_load_question(this_period,_), [5,7,12]).
facto_dispara_regras(want_shift_load(this_period,_), [5,7,12]).
facto_dispara_regras(has_EV(this_period,_), [5,7,14,15,18,21,26,29,32,33]).
facto_dispara_regras(selling(this_period,_), [6]).
facto_dispara_regras(excess(this_period,_), [6]).
facto_dispara_regras(check_battery(this_period, _), [8,9]).
facto_dispara_regras(battery_ev(this_period,_), [8,9,16,17,19,20,27,28,34,35]).
facto_dispara_regras(check_expensive_hour(this_period, _), [10,11]).
facto_dispara_regras(expensive_hour(this_period,_), [10,11,30,31]).
facto_dispara_regras(shift_load_options(this_period,_), [13]).
facto_dispara_regras(options(this_period,_), [13]).
facto_dispara_regras(check_battery_scarcity(this_period, _), [16,17]).
facto_dispara_regras(ratio_less_than_one(this_period,_), [18,21,22]).
facto_dispara_regras(check_battery_scarcity_r_less_than_one(this_period, _), [19,20]).
facto_dispara_regras(r_improvement(this_period,_), [23,24,25]).
facto_dispara_regras(can_improve_r(this_period,_), [23,24,25]).
facto_dispara_regras(ratio_equals_zero(this_period,_), [26,29,32,33]).
facto_dispara_regras(check_battery_r_equals_zero(this_period,_), [27,28]).
facto_dispara_regras(check_expensive_hour_r_equals_zero(this_period, _), [30,31]).
facto_dispara_regras(check_battery_scarcity_r_equals_zero(this_period,_), [34,35]).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ultimo_facto(26).
ultima_regra(34).

%%%%%%%%%%%%%%%%%%Individual%%%%%%%%%%%%%%%%%%%%


% Ratio superior a 1
regra 1
	se [usertype(individual) e avalia(ratio(this_period,>,1))]
	entao [cria_facto(ratio_more_than_one(this_period,1))].

% Ratio inferior a 1
regra 2
	se [usertype(individual) e avalia(ratio(this_period,<=,1)) e avalia(ratio(this_period,>,0)]
	entao [cria_facto(ratio_less_than_one(this_period,1))].

%Ratio igual a 0
regra 3 
    se [usertype(individual) e avalia(ratio(this_period,=,0))]
	entao [cria_facto(ratio_equals_zero(this_period,1))].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[R>1]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
regra 4
	se[ratio_more_than_one(this_period,1) e predicted_scarcity(this_period,0)]
	entao [cria_facto(shift_load_question(this_period,1))].

regra 5
	se [shift_load_question(this_period,1) e want_shift_load(this_period,0) e has_EV(this_period,0)]
	entao [cria_facto(selling(this_period,1))].

regra 6
	se [selling(this_period,1) e excess(this_period,E)]
	entao [cria_facto(should_sell(this_period, E))].

regra 7
	se [shift_load_question(this_period,1) e want_shift_load(this_period,0) e has_EV(this_period,1)]
	entao [cria_facto(check_battery(this_period,1))].

regra 8
	se [check_battery(this_period, 1) e avalia(battery_ev(this_period,>=,50))]
	entao [cria_facto(selling(this_period,1))].

regra 9
	se [check_battery(this_period, 1) e avalia(battery_ev(this_period,<,50))]
	entao [cria_facto(check_expensive_hour(this_period,1))].

regra 10
	se [check_expensive_hour(this_period, 1) e expensive_hour(this_period,1)]
	entao [cria_facto(selling(this_period,1))].

regra 11
	se [check_expensive_hour(this_period, 1) e expensive_hour(this_period,0)]
	entao [cria_facto(charge_battery(this_period,1))].

regra 12
	se [shift_load_question(this_period,1) e want_shift_load(this_period,1)]
	entao [cria_facto(shift_load_options(this_period,1))].

regra 13
	se [shift_load_options(this_period,1) e options(this_period, OP)]
	entao [print_options(OP)].

regra 14
	se[ratio_more_than_one(this_period,1) e predicted_scarcity(this_period,1) e has_EV(this_period,0)]
	entao [cria_facto(selling(this_period,1))].

regra 15
	se[ratio_more_than_one(this_period,1) e predicted_scarcity(this_period,1) e has_EV(this_period,1)]
	entao [cria_facto(check_battery_scarcity(this_period,1))].

regra 16
	se [check_battery_scarcity(this_period, 1) e avalia(battery_ev(this_period,<,50))]
	entao [cria_facto(charge_battery(this_period,1))].

regra 17
	se [check_battery_scarcity(this_period, 1) e avalia(battery_ev(this_period,>=,50))]
	entao [cria_facto(selling(this_period,1))].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[1>=R>0]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
regra 18
	se[ratio_less_than_one(this_period,1) e predicted_scarcity(this_period,1) e has_EV(this_period,1)]
	entao [cria_facto(check_battery_scarcity_r_less_than_one(this_period,1))].

regra 19
	se [check_battery_scarcity_r_less_than_one(this_period, 1) e avalia(battery_ev(this_period,<,50))]
	entao [cria_facto(charge_battery(this_period,1))].

regra 20
	se [check_battery_scarcity_r_less_than_one(this_period, 1) e avalia(battery_ev(this_period,>=,50))]
	entao [cria_facto(r_improvement(this_period,1))].

regra 21
	se [ratio_less_than_one(this_period,1) e predicted_scarcity(this_period,1) e has_EV(this_period,0)]
	entao [cria_facto(r_improvement(this_period,1))].
	
regra 22
	se [ratio_less_than_one(this_period,1) e predicted_scarcity(this_period,0)]
	entao [cria_facto(r_improvement(this_period,1))].
	
regra 23
	se [r_improvement(this_period,1) e can_improve_r(this_period,1)]
	entao [print_improvements].

regra 24
	se [r_improvement(this_period,1) e can_improve_r(this_period,0) e avalia(ratio(this_period,=,1)]
	entao [print_no_operation].

regra 25
	se [r_improvement(this_period,1) e can_improve_r(this_period,0) e avalia(ratio(this_period,=\=,1)]
	entao  [cria_facto(buy_from_cheapest_market(this_period,1))].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[R<0]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

regra 26
	se[ratio_equals_zero(this_period,1) e predicted_scarcity(this_period,0) e has_EV(this_period,1)]
	entao [cria_facto(check_battery_r_equals_zero(this_period,1))].
	
regra 27
	se [check_battery_r_equals_zero(this_period,1) e avalia(battery_ev(this_period,<,50))]
	entao [cria_facto(charge_battery(this_period,1))].

regra 28
	se [check_battery_r_equals_zero(this_period,1) e avalia(battery_ev(this_period,>=,50))]
	entao [cria_facto(use_battery(this_period,1))].
	
regra 29
	se[ratio_equals_zero(this_period,1) e predicted_scarcity(this_period,0) e has_EV(this_period,0)]
	entao [cria_facto(check_expensive_hour_r_equals_zero(this_period,1))].

regra 30
	se [check_expensive_hour_r_equals_zero(this_period, 1) e expensive_hour(this_period,1)]
	entao [print_shift_load_to_essential_consumption].

regra 31
	se [check_expensive_hour_r_equals_zero(this_period, 1) e expensive_hour(this_period,0)]
	entao [cria_facto(keep_buying(this_period,1))].

regra 32
	se[ratio_equals_zero(this_period,1) e predicted_scarcity(this_period,1) e has_EV(this_period,0)]
	entao [cria_facto(check_expensive_hour_r_equals_zero(this_period,1))].

regra 33
	se[ratio_equals_zero(this_period,1) e predicted_scarcity(this_period,1) e has_EV(this_period,1)]
	entao [cria_facto(check_battery_scarcity_r_equals_zero(this_period,1))].
	
regra 34
	se [check_battery_scarcity_r_equals_zero(this_period,1) e avalia(battery_ev(this_period,<,50))]
	entao [cria_facto(charge_battery(this_period,1))].

regra 35
	se [check_battery_scarcity_r_equals_zero(this_period,1) e avalia(battery_ev(this_period,>=,50))]
	entao [cria_facto(check_expensive_hour_r_equals_zero(this_period,1))].




facto(1,solar_radiation(this_period,112)).
facto(2,temperature(this_period,6)).
facto(3,wind_speed(this_period,15)).


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
facto(22,device(ev,150)).
facto(23,has_EV(this_period,1)).
facto(24,predicted_scarcity(this_period,0)).
facto(25,want_shift_load(this_period,0)).
facto(26, battery_ev(this_period,89)).
facto(27,preco_medio(this_period,0.12)).

facto(28, usertype(community))

%%%%%%%%%%%%%%%%%%Community%%%%%%%%%%%%%%%%%%%%




% Ratio superior a 1
regra 36
	se [usertype(community) e avalia(community_ratio(this_period,>,1))]
	entao [cria_facto(community_ratio_more_than_one(this_period,1))].

% Ratio inferior a 1
regra 37
	se [usertype(community) e avalia(community_ratio(this_period,<=,1))]
	entao [cria_facto(community_ratio_less_than_one(this_period,1))].

regra 38
    se [ community_ratio_more_than_one(this_period,1) e community_predicted_scarcity(this_period,1)]
	entao [community_check_battery(this_period,1)].

regra 39
	se [community_check_battery(this_period,1) e avalia(community_battery(this_period,<,50))]
	entao [cria_facto(charge_community_battery(this_period,1))].
	
regra 40 
	se [community_check_battery(this_period,1) e avalia(community_battery(this_period,>=,50))]
	entao [cria_facto(check_community_demand(this_period,1))].

regra 41 
    se [ community_ratio_more_than_one(this_period,1) e community_predicted_scarcity(this_period,0)]
	entao [cria_facto(check_community_demand(this_period,1))].
	
regra 42
	se [check_community_demand(this_period,1) e community_demand(this_period,1)]
	entao [cria_facto(sell_to_local_community_market(this_period,1))].

regra 43
	se [check_community_demand(this_period,1) e community_demand(this_period,0)]
	entao [cria_facto(check_community_external_market_demand(this_period,1))].

regra 44
	se [check_community_external_market_demand(this_period,1) e external_market_demand(this_period,1)]
	entao [cria_facto(sell_to_external_market(this_period,1))].
	
regra 45
	se [check_community_external_market_demand(this_period,1) e external_market_demand(this_period,0)]
	entao [cria_facto(send_to_the_grid(this_period,":(😢"))].
	
regra 46 
	se [community_ratio_less_than_one(this_period,1) e current_energy_scarcity(this_period,1)]
	entao [cria_facto(check_community_batteries_charged(this_period,1))].

regra 47
	se[check_community_batteries_charged(this_period,1) e avalia(community_battery(this_period,>=,80)]
	entao [cria_facto(use_community_battery_energy(this_period,1))].
	
regra 48
	se [community_ratio_less_than_one(this_period,1) e current_energy_scarcity(this_period,0)]
	entao [cria_facto(check_community_participants_with_surplus(this_period,1))].

regra 49
	se[check_community_batteries_charged(this_period,1) e avalia(community_battery(this_period,<,80)]
	entao [cria_facto(check_community_participants_with_surplus(this_period,1))].
	
regra 50
	se[check_community_participants_with_surplus(this_period,1) e participant_with_surplus(this_period,1)]
	entao [cria_facto(should_exchange_energy_between_community_members(this_period,1))].

regra 51 
	se [participant_with_surplus(this_period,0) e community_predicted_scarcity(this_period,1)]
	entao [cria_facto(buy_from_external_market(this_period,1))].

regra 52 
	se [community_predicted_scarcity(this_period,0) e community_expensive_hour(this_period,0)]
	entao [cria_facto(buy_from_external_market(this_period,1))].

regra 53
	se [community_predicted_scarcity(this_period,0) e community_expensive_hour(this_period,1)]
	entao [cria_facto(check_community_battery_suff_charged(this_period,1))].
	
regra 54 
	se [check_community_battery_suff_charged(this_period,1) e avalia(community_battery(this_period,>=,50))]
	entao [cria_facto(use_community_battery_energy(this_period,1))].
	
regra 55
	se [check_community_battery_suff_charged(this_period,1) e avalia(community_battery(this_period,<,50))]
	entao [cria_facto(buy_from_external_market(this_period,1))].



	

	
	
	














