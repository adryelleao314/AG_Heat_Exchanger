function hfg_flash = calculate_IAPWS_hfg_flash(p_flash)
hfg_flash = IAPWS_IF97('hV_p', p_flash) - IAPWS_IF97('hL_p', p_flash);
hfg_flash = hfg_flash.*1000;
end