% state(country, name).
state(unitedstates, arizona).
state(unitedstates, california).
state(unitedstates, newmexico).
state(unitedstates, texas).
state(unitedstates, louisiana).
state(unitedstates, oklahoma).
state(unitedstates, colorado).
state(unitedstates, utah).
state(unitedstates, nevada).
state(mexico, chihuahua).
state(mexico, sonora).
state(mexico, coahuila).
state(mexico, durango).
state(mexico, veracruz).
state(mexico, bajacalifornia).

%stateinfo(Name, Population, Area-sq-mi)
stateinfo(chihuahua, 3400000, 96000).
stateinfo(sonora, 2700000, 69000).
stateinfo(coahuila, 2700000, 58000).
stateinfo(california, 34000000, 163000).
stateinfo(texas, 21000000, 269000).
stateinfo(arizona, 5000000, 111990).

% isState/1
isState(State) :- state(_, State).

% biggerstate/2
biggerstate(State1, State2) :-  % will return false if given a false State
				stateinfo(State1, _, Pop1),
				stateinfo(State2, _, Pop2),
				Pop1 > Pop2.
				


