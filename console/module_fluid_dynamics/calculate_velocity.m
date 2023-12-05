function u = calculate_velocity(fluid, m)

rho = fluid.rho;
A = fluid.Area;

u = m./(rho.*A);

end