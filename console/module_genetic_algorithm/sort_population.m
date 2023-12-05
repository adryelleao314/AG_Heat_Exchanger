function FExchanger = sort_population(FExchanger)
size_pop = size(FExchanger,2);
for j=1:size_pop
    for i=1:size_pop-j
        if FExchanger(i).individual.score > FExchanger(i+1).individual.score
            aux = FExchanger(i).individual;
            FExchanger(i).individual = FExchanger(i+1).individual;
            FExchanger(i+1).individual = aux;
        end
    end
end
end