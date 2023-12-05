function Dh = calculate_Dh(individual)

Di = individual.Di;
de = individual.de;
N_tubes = individual.N_tubes;

%A = (pi()./4).*((Di.^2)-N_tubes.*(de.^2));

A = individual.steam.Area;
P = pi().*(Di + N_tubes.*de);

Dh = 4.*A./P;

end