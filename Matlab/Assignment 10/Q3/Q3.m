clear;
fruits = ["apple"; "banana"; "cherry"; "dates"];
fSize = size(fruits);

minPr = 40; maxPr = 100;
prices = minPr + (maxPr - minPr)*rand(fSize);

buyFruit = randi([0 1], fSize);

% a = [fruits prices buyFruit];

onehotMat = priceOneHotEncode(fSize(1)+1, buyFruit, prices);
disp(onehotMat)

fileID = fopen("Q3_Output.txt", "w");
fprintf(fileID, "%5s \t%6s \t%6s \t%5s \t%5s\n", [fruits;"price"]);

fprintf(fileID, "%5d \t%6d \t%6d \t%5d \t%5.2f\n\n\n", onehotMat(1:end-1,:)');

fprintf(fileID, "---------------------------------------\n\n");

fprintf(fileID, "%5d \t%6d \t%6d \t%5d \t%5.2f", onehotMat(end,:));

fclose(fileID);

%% Functions

function totPrice = calcPrice(priceArr, buyNotBuy)
totPrice = 1;    
priceArr = priceArr(logical(buyNotBuy));
N = length(priceArr);
for j = 1:N
    totPrice = totPrice * priceArr(j);
end
totPrice = N * (totPrice^(1/N));
end

function onehot = priceOneHotEncode(sz, buyFruit, prices)
onehot = zeros(sz);
totPrice = calcPrice(prices, buyFruit);
for i = 1:sz-1
    onehot(i,i) = buyFruit(i);
    onehot(i,end) = buyFruit(i)*prices(i);
end
onehot(end,:) = [buyFruit; totPrice];
end