function individual = heat_exchanger_main(individual)

global ActiveAG;

individual.water.cp = 4.18*1000; %Initial water cp in J/kgK

%Calculate the flash steam
individual.steam.hf_flash = calculate_IAPWS_hf_flash(individual.steam.p_flash);
individual.steam.hg_flash = calculate_IAPWS_hg_flash(individual.steam.p_flash);
individual.steam.hfg_flash = calculate_IAPWS_hfg_flash(individual.steam.p_flash);
individual.steam.x_flash = calculate_IAPWS_x_flash(individual.steam.p_oper, individual.steam.p_flash);
individual.steam.m_flash = calculate_m_flash(individual.steam.x_flash, individual.m_cond);
individual.steam.T_flash = calculate_T_flash(individual.steam.p_flash);
    
%Calculate heat transfer - q
individual.steam.q = calculate_q_flash(individual.steam); %J/s = W

%Calculate Tf_sai
individual.water.Tf_sai = calculate_Tf_sai(individual);

%Calculate T_med - Used to evaluate water properties
individual.water.T_med = (individual.water.Tf_ent + individual.water.Tf_sai)./2;

%Calculate dTml
individual.dTml = calculate_dTml(individual.steam.T_flash, individual.water.Tf_ent, individual.water.Tf_sai, individual.flowDir);


%%%%% FLUID PROPERTIES %%%%%
 
%Water Properties
individual.water.hf = 1000*IAPWS_IF97('h_pT', individual.water.p_ent, individual.water.T_med);
individual.water.cp = 1000.*IAPWS_IF97('cp_ph', individual.water.p_ent, individual.water.hf./1000);
individual.water.rho = 1./IAPWS_IF97('v_ph', individual.water.p_ent, individual.water.hf/1000);
individual.water.k = IAPWS_IF97('k_pT', individual.water.p_ent, individual.water.T_med);
individual.water.mhi = IAPWS_IF97('mu_ph', individual.water.p_ent, individual.water.hf/1000);
individual.water.Pr = calcula_Pr(individual.water);


%Steam Properties
individual.steam.Pr = 0.987;
individual.steam.cp = 1000.*IAPWS_IF97('cp_ph', individual.steam.p_flash, individual.steam.hg_flash/1000);
individual.steam.cp = 2100;
individual.steam.rho = 1./IAPWS_IF97('v_ph', individual.steam.p_flash, individual.steam.hg_flash/1000);
individual.steam.k = IAPWS_IF97('k_ph', individual.steam.p_flash, individual.steam.hg_flash/1000);
individual.steam.mhi = IAPWS_IF97('mu_ph', individual.steam.p_flash, individual.steam.hg_flash/1000);
individual.steam.Pr = calcula_Pr(individual.steam);


%Calculate Re - For Water
individual.water.Area = calculate_Area_in(individual);
individual.water.u = calculate_velocity(individual.water, individual.water.mf/individual.N_tubes);
individual.water.Dh = individual.di;
individual.water.De = individual.di;
individual.water.Re = calculate_Re(individual.water);
individual.water.f = calculate_f_Petukhov(individual.water.Re);

%Calculate Re - For Steam
individual.steam.Area = calculate_Area_out(individual); %Area real - para calcular Dh
individual.steam.Dh = calculate_Dh(individual);
individual.steam.De = calculate_De(individual);
individual.steam.u = calculate_velocity(individual.steam, individual.steam.m_flash);   
individual.steam.Re = calculate_Re(individual.steam);  
individual.steam.f = calculate_f_Petukhov(individual.steam.Re);
    
%Calculate hi - Convective for internal flow
individual.Nu_i = calculate_Nusselt_Gnielinski(individual.water.Re, individual.water.Pr, individual.water.Dh, individual.water.f);
individual.hi = calculate_h(individual.Nu_i, individual.water.k, individual.di);

%Calculate he - Convective for external flow
individual.Nu_e = calculate_Nusselt_Gnielinski(individual.steam.Re, individual.steam.Pr, individual.steam.Dh, individual.steam.f);
individual.he = calculate_h(individual.Nu_e, individual.steam.k, individual.steam.Dh);
    
%%%%% CALCULATE EXCHANGER LENGHT %%%%%

%Calculate Heat Exchanger Length - L_LMTD
individual.L = calculate_LMTD_L(individual);
individual.L = (1+individual.F_A)*individual.L;

%Calculate the total Resistance 
individual.R_tot = calculate_R_tot(individual);
individual.UA = individual.N_tubes.*(1./(individual.R_tot));
individual.Area = individual.L.*pi().*individual.de.*individual.N_tubes;
individual.U = individual.UA./individual.Area;
end



