function FExchanger = select_population(FExchanger, N_ind)
for i=1:N_ind
    aux(i) = FExchanger(i);
end
FExchanger = aux;
end