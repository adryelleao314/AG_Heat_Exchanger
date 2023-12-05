function R_tot = calculate_R_tot(individual)

L = individual.L;
hi = individual.hi;
he = individual.he;
di = individual.di;
de = individual.de;
k = individual.pipe.k;

R_tot = (1./(pi().*L))*((1./(hi.*di)) + (log(de/di)./(2.*k)) + (1./(he.*de)));

end