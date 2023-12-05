function [score_mean, std_mean] = calculate_score_mean(FExchanger, i_pop)
for i=1:size(FExchanger,2)
    aux(i) = FExchanger(i).individual.score;
end
score_mean = mean(aux);
std_mean = std(aux);
end