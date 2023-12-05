function Re = calculate_Re(fluid)

rho = fluid.rho;
u = fluid.u;
mhi = fluid.mhi;
Dh = fluid.Dh;

Re = (rho.*u.*Dh)./mhi;

end