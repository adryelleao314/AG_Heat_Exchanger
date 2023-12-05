function P_wet = calculate_P_wet(individual, type)

%Type 0 = Water
%Type 1 = Steam

di = individual.di;
de = individual.de;
Di = individual.Di;
N_tubes = individual.N_tubes;

if type == 0

else
    P_wet = pi().*di;
end
    P_wet = pi().*(Di + N_tubes.*de);
end