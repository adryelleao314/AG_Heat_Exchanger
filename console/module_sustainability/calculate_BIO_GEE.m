function individual = calculate_BIO_GEE(individual)

individual = calculate_fuel_consume(individual);

individual = calculate_fuel_economy(individual);

individual = calculate_emissions(individual);


end