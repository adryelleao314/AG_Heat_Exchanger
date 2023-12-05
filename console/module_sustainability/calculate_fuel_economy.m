function individual = calculate_fuel_economy(individual)

individual.M_ano = individual.C_comb.*individual.Q_comb.*individual.t_ano;

end