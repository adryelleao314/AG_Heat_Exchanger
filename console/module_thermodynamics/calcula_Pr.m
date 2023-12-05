function Pr = calcula_Pr(fluid)
mhi = fluid.mhi;
cp = fluid.cp;
k = fluid.k;
Pr = (mhi.*cp)./k;
end