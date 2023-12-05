function dTml = calculate_dTml(Tflash, Tf_ent, Tf_sai, flowD)

%flow = 0 -> Parallel
%flow = 1 -> Countercurrent

if (flowD == 0)
    dTent = Tflash - Tf_ent;
    dTsai = Tflash - Tf_sai;
else
    dTent = Tflash - Tf_sai;
    dTsai = Tflash - Tf_ent;
end

dTml = (dTsai - dTent)/(log(dTsai/dTent));

end