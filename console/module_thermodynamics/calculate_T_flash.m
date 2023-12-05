function T_flash = calculate_IAPWS_T_flash(p_flash)
%This function calculates the flash steam temperature
T_flash = IAPWS_IF97('Tsat_p', p_flash);
end