function individual = generate_chosen(Findividual, process_data)

individual = Findividual;
individual.eta = process_data.eta_boiler;
individual.PCI = process_data.PCI;
individual.C_comb = process_data.C_comb;
individual.t_ano = process_data.t_ano;
individual.FCO2 = process_data.FCO2;

end