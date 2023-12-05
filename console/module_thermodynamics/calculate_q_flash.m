function q = calculate_q_flash(steam)
m_flash = steam.m_flash;
hfg = steam.hfg_flash;
q = m_flash.*hfg;
end