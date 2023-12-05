function A = calculate_Area_out(individual)

Di = individual.Di;
de = individual.de;
N = individual.N_tubes;

A = (pi()./4).*((Di.^2)-(N.*(de.^2)));

end