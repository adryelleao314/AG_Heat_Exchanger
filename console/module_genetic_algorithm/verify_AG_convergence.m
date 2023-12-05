function convergence = verify_AG_convergence(mean_array, i_pop)
global precision
convergence = 0;
N_conv = 10;
if (i_pop > N_conv+1)  
    dev_sum = 0;
    for i=1:size(mean_array,2)
        if mean_array(i) <= precision
            dev_sum = dev_sum + 1;
        end
    end 
    if dev_sum == N_conv
        convergence = 1;
    end   
else 
    convergence = 0;
end
end