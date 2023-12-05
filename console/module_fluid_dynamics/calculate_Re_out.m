function Re = calculate_Re_out(fluid, m)

mhi = fluid.mhi;
A = fluid.Area;
Dh = fluid.Dh;

Re = (m.*Dh)./(mhi.*A);

end