function hf_flash = calculate_IAPWS_hf_flash(p_flash)
hf_flash = IAPWS_IF97('hL_p', p_flash);
hf_flash = hf_flash.*1000;
end