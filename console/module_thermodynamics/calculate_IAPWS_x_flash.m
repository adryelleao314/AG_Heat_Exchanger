function x_flash = calculate_IAPWS_x_flash(p1, p2)
hf_1 = IAPWS_IF97('hL_p', p1);
hf_2 = IAPWS_IF97('hL_p', p2);
hfg_2 = IAPWS_IF97('hV_p', p2)- IAPWS_IF97('hL_p', p2);
x_flash = (hf_1 - hf_2)/hfg_2;
end