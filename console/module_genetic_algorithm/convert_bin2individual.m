function individual = convert_bin2individual(individual)
global list_Shell
global list_Tube

%DIGIT 1 - FLOW DIRECTION
individual.flowDir = individual.bin_array(1);
%DIGIT 2-4 - SHELL DIAMETER
i = 1+ bin2dec(num2str(individual.bin_array(2:4)));
individual.De = list_Shell(i).De;
individual.Di = list_Shell(i).Di;
%DIGIT 5-7 - TUBES DIAMETER
i = 1+ bin2dec(num2str(individual.bin_array(5:7)));
individual.de = list_Tube(i).De;
individual.di = list_Tube(i).Di;
%DIGIT 8-14 - NUMBER OF TUBES
individual.N_tubes = 1 + bin2dec(num2str(individual.bin_array(8:14)));
end