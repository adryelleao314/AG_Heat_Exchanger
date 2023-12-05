function k = calculate_k_water(p, T)
k = IAPWS_IF97('k_pT', p, T);
end