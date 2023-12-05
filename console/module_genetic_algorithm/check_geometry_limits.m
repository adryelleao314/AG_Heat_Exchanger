function check = check_geometry_limits(individual)
Di = individual.Di;
de = individual.de;
di = individual.di;
N_tubes = individual.N_tubes;
A_out = pi().*(Di.^2)./4;
A_in = N_tubes.*(pi().*(de.^2)./4);
R_area = A_in/A_out;
if R_area > 0.8
    check = 1;
else
    check = 0;
end
end