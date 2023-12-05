function plot_score(FExchanger, i_pop, N_pop)

global xmax;
global ymax;

for i=1:size(FExchanger,2)
    x_plot(i) = i_pop;
    y_plot(i) = FExchanger(i).individual.score;
    L_plot(i) = FExchanger(i).individual.L;
end

%Define xmax for x limits
xmax_aux = 1.1*max(x_plot);
if xmax_aux > xmax
    xmax = xmax_aux;
end

%Define ymax for y limits
ymax_aux= 1.1*max(y_plot);
if ymax_aux > ymax
    ymax = ymax_aux;
end

figure(1)
hold on
box on
plot(x_plot,y_plot,'.', 'Color', 'blue')
xlabel("População");
ylabel("Comprimento");

xlim([0 xmax]); 
ylim([0 ymax]);
set(gcf,'position',[50,50,800,200])
end