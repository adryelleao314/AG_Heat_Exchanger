clear
clc

tic;

run_addpath()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%     ENTRIES     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Condensate flowmass [kg/h]
m_cond = 5000;

%Boiler Operational Pressure [bar (a)]
p_oper = 11;
p_oper = p_oper/10; %Converting to MPa

%Flash Pressure [bar (a)]
p_flash = 1.2;
p_flash = p_flash/10; %Converting to MPa

%Make-Up Water Flowrate [kg/h]
mf = 10000;

%Make-Up Water Temperature [oC] 
Tf_ent = 30;

%Water Pressure [bar (a)]
p_water = 6;

%Excess area of the exchanger [%]
F_A = 0.15;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%     DEFINITIONS     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ploting definitions
global xmax;
global ymax;
xmax = 0;
ymax = 0;

global porc_mutation;
porc_mutation = 1; 

global prob_mutation;
prob_mutation = 0.1;

global ActiveAG;
ActiveAG = true; % <<<<------ ACTIVATE THE AG
global convergence
convergence = 0;
N_ind = 50;
N_pop = 10000;

global precision;
precision = 0.01;


base_data.m_cond = m_cond/3600; %kg/s
base_data.steam.p_oper = p_oper;
base_data.steam.p_flash = p_flash;
base_data.water.mf = mf/3600; %Make-up water - kg/s;
base_data.F_A = F_A;
base_data.water.Tf_ent = Tf_ent + 273.15; %Convert Celsius do Kelvin
base_data.water.p_ent = p_water/10; %Mpa
base_data.pipe.k = 16.3; 



%PROCESS DATA
process_data.eta_boiler = 0.9;
process_data.PCI = 8500*1000*4.18; %Natural Gas
process_data.C_comb = 3.5485; %Fuel cost in R$/m3
process_data.t_ano = 8400; %Time in hours
process_data.FCO2 = 56100; %CO2 emission factor in tCO2/TJ


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%     GLOBAL VARIABLES     %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global list_Shell
global list_Tube
read_pipe_list();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%     INITIAL POPULATION     %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i_ind = 1:N_ind
    check_valid = 1;
    while check_valid ==1
        FExchanger(i_ind).individual.bin_array = create_initial_bin();
        FExchanger(i_ind).individual = convert_bin2individual(FExchanger(i_ind).individual);
        check_valid = check_geometry_limits(FExchanger(i_ind).individual);
        
        if check_valid == 0
            FExchanger(i_ind).individual = generate_individual(FExchanger(i_ind).individual, base_data);
        end
    end
end
  
%Size initial population
for i_ind = 1:N_ind
        FExchanger(i_ind).individual = heat_exchanger_main(FExchanger(i_ind).individual);  
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%     POPULATION SCORE     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Initiate Genetic Algorithm
if (ActiveAG == true)
    i_pop = 1;
    while (i_pop<=N_pop && convergence == 0)
    %while (i_pop<=N_pop)
        disp('Populacao')
        disp(i_pop)
        %Crossover - First create a paralell group with the individual from
        %the crossover
        FExchanger = crossover_population(FExchanger, N_ind); 
        
        %Mutation
        for i_ind = (N_ind + 1):size(FExchanger, 2)
            check_valid = 1;
            while check_valid == 1
                FExchanger(i_ind).individual = mutate_individual(FExchanger(i_ind).individual);
                FExchanger(i_ind).individual = convert_bin2individual(FExchanger(i_ind).individual);
                check_valid = check_geometry_limits(FExchanger(i_ind).individual);
            end
        end

        %Show individuals
        for i=1:size(FExchanger,2)
            aux_bin(i,:) = FExchanger(i).individual.bin_array;
        end

        %Generate New Individuals
        for i_ind = (N_ind + 1):size(FExchanger,2)
                FExchanger(i_ind).individual = generate_individual(FExchanger(i_ind).individual, base_data);
        end
        
        
        %Size i_pop population
        for i_ind = (N_ind + 1):size(FExchanger,2)
            FExchanger(i_ind).individual = heat_exchanger_main(FExchanger(i_ind).individual);    
        end  

        %Evaluate Population
        for i_ind = 1:size(FExchanger,2)
            FExchanger(i_ind).individual = evaluate_individual(FExchanger(i_ind).individual);    
        end         
 
        %Sort the population
        FExchanger = sort_population(FExchanger);

        %Select the best options
        FExchanger = select_population(FExchanger, N_ind);
        
        %Plot the Score
        plot_score(FExchanger, i_pop, N_pop)
        
        %Score Mean
        [score_mean(i_pop), std_mean(i_pop)] = calculate_score_mean(FExchanger, i_pop);
        x_score_mean(i_pop) = i_pop;
        
        %Check Convergence - After N_conv iterations
        convergence = verify_AG_convergence(std_mean, i_pop);
        
        if convergence == 1
            disp('CONVERGED');
        end
        

        i_pop = i_pop + 1;
    end 
    hold off
    
    disp('Best option Score')
    disp(score_mean(size(score_mean,2)))


    %Plot best option
    figure(1)
    hold on
    x = i_pop;
    y = FExchanger(1).individual.score;
    plot(i_pop,FExchanger(1).individual.score,'o', 'Color', 'red')

end

running_time = toc

individual_chosen = generate_chosen(FExchanger(1).individual, process_data);
individual_chosen = calculate_BIO_GEE(individual_chosen);