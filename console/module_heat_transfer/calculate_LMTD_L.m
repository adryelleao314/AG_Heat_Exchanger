function L = calculate_LMTD_L(individual)

%This function calculates the length considering LMTD

N_tubes = individual.N_tubes; 
mf = individual.water.mf;
dT = individual.water.Tf_sai - individual.water.Tf_ent;
cp = individual.water.cp;

q = individual.steam.q./N_tubes;
dTml = individual.dTml;
hi = individual.hi;
he = individual.he;
di = individual.di;
de = individual.de;
k = individual.pipe.k;

L = (q./(pi()*dTml))*((1./(hi.*di))+ (log(de/di)./(2.*k)) + (1./(he.*de)));
end