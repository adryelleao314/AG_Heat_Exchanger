function individual = mutate_individual(individual)
global porc_mutation;
global prob_mutation;
global precision;
%Number of chromossomes - Array Size
size_array = size(individual.bin_array,2);
%Mutation Array
mutate_array = zeros(1,size_array);
num_mutation = round(size_array*porc_mutation);
bin_array_old = individual.bin_array;
%Choose the positions to be mutate
for i_mut=1:num_mutation
    check = 0;
    while check == 0
        aux_mut = randi([1 size_array]);
        if i_mut == 1
            mutate_positions(i_mut) = aux_mut;
            check = 1;
        else
             check = check_mutate_array(aux_mut, mutate_positions);
            if check == 1
                mutate_positions(i_mut) = aux_mut;
            end
        end
    end
    %Probability of mutation
    rand_mutation = precision*randi([(0/precision) (1/precision)]);
    if rand_mutation <= prob_mutation
        mutate_array(mutate_positions(i_mut)) = 1;
    end
end
%Individual Mutation
for i=1:size_array
    if (mutate_array(i) == 1)
        individual.bin_array(i) = mutate_chromossome(individual.bin_array(i));
    end
end
end