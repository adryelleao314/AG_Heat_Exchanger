function run_addpath()

addpath("../adds/XSteam");

%Add IAPWS functions to calculate water and steam properties
addpath("../adds/IF97");

%Add Fluid dynamics module
addpath(genpath('module_fluid_dynamics'));

%Add general functions module, as read files functions
addpath(genpath('module_functions'));

%Add Genetic Algorithm module
addpath(genpath('module_genetic_algorithm'));

%Add Heat Transfer module
addpath(genpath('module_heat_transfer'));

%Add Results module
addpath(genpath('module_results'));

%Add Thermodynamics module
addpath(genpath('module_thermodynamics'));

%Add Sustainability module
addpath(genpath('module_sustainability'));


end