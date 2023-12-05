function Tf_sai = calculate_Tf_sai(individual)
Tf_ent = individual.water.Tf_ent;
m_flash = individual.steam.m_flash;
hfg_flash = individual.steam.hfg_flash;
q_flash = m_flash.*hfg_flash;
mf = individual.water.mf;
cp = individual.water.cp;
Tf_sai = Tf_ent + (q_flash./(mf*cp));
end