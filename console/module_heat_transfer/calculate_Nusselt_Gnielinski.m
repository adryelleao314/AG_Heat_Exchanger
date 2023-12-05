function Nu = calculate_Nusselt_Gnielinski(Re, Pr, D, f)

if Re <= 2300
    Nu  = 3.66;
else
    Nu = ( (f/8).*(Re-1000).*Pr)/(1+ 12.7*((f/8).^(0.5)).*((Pr.^(2/3))-1));

end

end