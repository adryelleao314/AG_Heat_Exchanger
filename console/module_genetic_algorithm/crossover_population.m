function FExchanger = crossover_population(FExchanger, N_ind)
i_cross = N_ind + 1;
for i=1:N_ind/2
    check_valid = 1;
    while check_valid == 1
        i_pos1 = randi([1 N_ind]);
        i_pos2 = randi([1 N_ind]);
        check = 0;
        ind_1 = FExchanger(i_pos1).individual.bin_array;
        ind_2 = FExchanger(i_pos2).individual.bin_array;
        [FExchanger(i_cross).individual.bin_array, FExchanger(i_cross+1).individual.bin_array] = crossover_individual(ind_1, ind_2);       
        FExchanger(i_cross).individual = convert_bin2individual(FExchanger(i_cross).individual);
        FExchanger(i_cross+1).individual = convert_bin2individual(FExchanger(i_cross+1).individual);
        check_valid1 = check_geometry_limits(FExchanger(i_cross).individual);
        check_valid2 = check_geometry_limits(FExchanger(i_cross+1).individual);     
        if check_valid1 == 0
            if (check_valid2 == 0)
                i_cross = i_cross + 2;
                check_valid = 0;
            end
        end      
    end
end
end