function Re = calculate_Re_in(fluid, m, d)

mhi = fluid.mhi;

Re = (4.*m)./(pi().*mhi.*d);

end