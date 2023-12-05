function read_pipe_list()

global list_Shell
global list_Tube

file = '..\files\shell_pipe_list.xlsx';

A = readtable(file);

for i=1:size(A,1)
    list_Shell(i).DN = table2array(A(i,1));
    list_Shell(i).Di = table2array(A(i,3));
    list_Shell(i).De = table2array(A(i,4));
end



clear A;

file = '..\files\tube_pipe_list.xlsx';

A = readtable(file);

for i=1:size(A,1)
    list_Tube(i).DN = table2array(A(i,1));
    list_Tube(i).Di = table2array(A(i,3));
    list_Tube(i).De = table2array(A(i,4));
end

clear A
end