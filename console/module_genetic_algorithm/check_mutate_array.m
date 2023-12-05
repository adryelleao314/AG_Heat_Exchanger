function check = check_mutate_array(aux_mut, mutate_positions)
check = 1;
size_array = size(mutate_positions,2);
i = 1;
for i=1:size_array
    if mutate_positions(i) == aux_mut
        check = 0;
    end
end
end