function individual = calculate_emissions(individual)

individual.QCO2 = individual.Q_comb.*individual.t_ano.*individual.PCI.*individual.FCO2/(1E12);

end