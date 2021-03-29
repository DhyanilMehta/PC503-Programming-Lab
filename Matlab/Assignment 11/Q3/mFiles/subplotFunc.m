function subplotFunc(timeDistArr, xFuncArr, numSubplots)
for pos = 1:numSubplots
    if pos == 1
        t = 1;
    else
        t = 2;
    end
    plotGraphIn2by3(timeDistArr(t,:), xFuncArr(pos,:), pos);
    title("X" + num2str(pos));
end
end
