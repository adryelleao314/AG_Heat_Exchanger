function individual = generate_individual(individual, base_data)
individual.m_cond = base_data.m_cond;
individual.steam.p_oper = base_data.steam.p_oper;
individual.steam.p_flash = base_data.steam.p_flash;
individual.water.mf = base_data.water.mf;
individual.F_A = base_data.F_A;
individual.water.Tf_ent = base_data.water.Tf_ent;
individual.water.p_ent = base_data.water.p_ent;
individual.pipe.k = base_data.pipe.k; 
end