function [ind_1, ind_2] = crossover_individual(ind_1, ind_2)
size1 = size(ind_1,2);
size2 = size(ind_2,2);
if(size1 == size2)
    position = randi([2 size1-1]);
    for i=1:position
        aux = ind_2(i);
        ind_2(i) = ind_1(i);
        ind_1(i) = aux;
    end
else
    disp("ERROR");
    quit
end
end