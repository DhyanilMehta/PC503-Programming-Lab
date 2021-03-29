clear;
% Last Lab Assignment
%% Part (a)
numArr = 9;
szArr = [3,3];
cellA1 = cell(1,numArr);
rangeAIni = [0,2];
incRange = 3; % Will keep increasing by 3 for setting rangeArr for arrays
for i = 1:numArr
    cellA1{i} = randi(rangeAIni + incRange * (i-1), szArr);
    disp(cellA1{i})
end

A1 = zeros(szArr*incRange);
tmp = 1;

g1XData = zeros(numArr, 1); % Will be center location of each array
g1YData = zeros(numArr, 1);
g1Labels = zeros(numArr, 1);
for r = 1:incRange:numArr-szArr(1)+1
    for c = 1:incRange:numArr-szArr(2)+1
        g1XData(tmp) = r + floor(szArr(1) / 2);
        g1YData(tmp) = c + floor(szArr(2) / 2);
        g1Labels(tmp) = max(max(cellA1{tmp}));
        A1(r : r + incRange - 1, c : c + incRange - 1) = cellA1{tmp};
        tmp = tmp + 1;
    end
end

cellA2 = cell(1,numArr);
rangeAIni = [21,23];
for i = 1:numArr
    cellA2{i} = randi(rangeAIni + incRange * (i-1), szArr);
    disp(cellA2{i})
end

A2 = zeros(szArr*incRange);
tmp = 1;

g2XData = g1XData + 9; % Will be center location of each array
g2YData = g1YData + 2;
g2Labels = zeros(numArr, 1);
for r = 1:incRange:numArr-szArr(1)+1
    for c = 1:incRange:numArr-szArr(2)+1
        g2Labels(tmp) = max(max(cellA2{tmp}));
        A2(r : r + incRange - 1, c : c + incRange - 1) = cellA2{tmp};
        tmp = tmp + 1;
    end
end

display(A1)
display(A2)
display(g1XData)
display(g1YData)
display(g1Labels)
display(g2XData)
display(g2YData)
display(g2Labels)

%% Part (b)
adjA1 = zeros(numArr, numArr);
adjA2 = zeros(numArr, numArr);

for i = 1:numArr-1
    for j = i+1:numArr
        up = g1XData(i) - g1XData(j) == -3 && g1YData(i) - g1YData(j) == 0;
        down = g1XData(i) - g1XData(j) == 3 && g1YData(i) - g1YData(j) == 0;
        left = g1XData(i) - g1XData(j) == 0 && g1YData(i) - g1YData(j) == -3;
        right = g1XData(i) - g1XData(j) == 0 && g1YData(i)- g1YData(j) == 3;
        
        if up || down || left || right
            adjA1(i,j) = abs(g1Labels(i) - g1Labels(j));
            adjA1(j,i) = adjA1(i,j);
        end
        
        up = g2XData(i) - g2XData(j) == -3 && g2YData(i) - g2YData(j) == 0;
        down = g2XData(i) - g2XData(j) == 3 && g2YData(i) - g2YData(j) == 0;
        left = g2XData(i) - g2XData(j) == 0 && g2YData(i) - g2YData(j) == -3;
        right = g2XData(i) - g2XData(j) == 0 && g2YData(i)- g2YData(j) == 3;
        
        if up || down || left || right
            adjA2(i,j) = abs(g2Labels(i) - g2Labels(j));
            adjA2(j,i) = adjA2(i,j);
        end
    end
end
clear tmp i j up down left right;

G1 = graph(adjA1);
G2 = graph(adjA2);

plot(G1,'XData',g1XData,'YData',g1YData,'NodeLabel',g1Labels,'EdgeLabel',G1.Edges.Weight)
hold on
plot(G2,'XData',g2XData,'YData',g2YData,'NodeLabel',g2Labels,'EdgeLabel',G2.Edges.Weight)
hold off

%% Part (c)
adjA12 = [adjA1 zeros(numArr, numArr); zeros(numArr, numArr) adjA2];
gXData = [g1XData; g2XData];
gYData = [g1YData; g2YData];
gLabels = [g1Labels; g2Labels];

sameValues = intersect(g1Labels, g2Labels);
cellSame = cell(size(sameValues));
for i = 1:length(sameValues)
    cellSame{i} = find(ismember(gLabels,sameValues(i)));
    
    adjA12(cellSame{i}(1), cellSame{i}(2)) = 1;
    adjA12(cellSame{i}(2), cellSame{i}(1)) = 1;
end

G = graph(adjA12);
figure;
plot(G,'XData',gXData,'YData',gYData,'NodeLabel',gLabels,'EdgeLabel',G.Edges.Weight)