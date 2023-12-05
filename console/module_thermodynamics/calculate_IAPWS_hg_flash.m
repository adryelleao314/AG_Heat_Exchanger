function hg_flash = calculate_IAPWS_hg_flash(p_flash)
hg_flash = IAPWS_IF97('hV_p', p_flash);
hg_flash = hg_flash.*1000;
end