function individual = calculate_fuel_consume(individual)

mf = individual.water.mf;
cp = individual.water.cp;
Tf_sai = individual.water.Tf_sai;
Tf_ent = individual.water.Tf_ent;
PCI = individual.PCI;
eta = individual.eta;
individual.Q_comb = 3600*(mf.*cp.*(Tf_sai - Tf_ent))./(PCI*eta); %Unidade em m3/h

end