function  bin_array = create_initial_bin()
size_array = 14;
bin_array = zeros(1,size_array);
for i=1:size_array
    bin_array(i) = randi([0 1]);
end
end
