:-dynamic facto/2, ultimo_facto/1.


ultimo_facto(20).
ultima_regra(1).

regra 1
	se [device(microwave,P) e device(ac,K)]
	entao [cria_facto(consumption(this_period,P+K))].




#vem pelo write
#device(EV,150).
#has_EV(this_period,1).


#period 1
#weather data
solar_radiation(this_period,112).
temperature(this_period,6).
wind_speed(this_period,15).

#production
production(this_period, 2000).

#devices
device(ac,200).
connected(ac,1).
essential(ac,1).

device(washing_machine,400).
connected(washing_machine,1).
essential(washing_machine,0).

device(dryer,100).
connected(dryer,0).
essential(washing_machine,0).

device(roomba,500).
connected(roomba,0).
essential(roomba,1).

device(microwave,100).
connected(microwave,1).
essential(microwave,1).

energy_price(this_period,0.005).










