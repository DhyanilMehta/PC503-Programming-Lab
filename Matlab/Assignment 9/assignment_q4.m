clear;
% clearvars -except data1 data2;
% Assignment Q4
numArr = randi(6) + 4;
sz = randi(2, [numArr 2]) + 1;
fprintf("Number of arrays generated: %d\n", numArr);
cellArr = cell([numArr 1]);
for iter = 1:numArr
    cellArr{iter} = randi(9, sz(iter, :));
    fprintf("Size: %d x %d\n", size(cellArr{iter}))
    disp(cellArr{iter})
end
% numArr = 8;
% cellArr = data2;


blockRows = randi(numArr);
blockCols = ceil(numArr/blockRows);
maxRC = max(sz);
% maxRC = [150 202];

concatArr = zeros(blockRows*maxRC(1), blockCols*maxRC(2)); ..., 3);

guardBands = 2;
guardBandArr = zeros(blockRows*maxRC(1) + ((blockRows-1) * guardBands), ...
    blockCols*maxRC(2) + ((blockCols-1) * guardBands)); ..., 3);

for c = 1:blockCols
    for r = 1:blockRows
        cellArrPos = r + blockRows*(c-1);
        if cellArrPos > numArr
            break;
        end
        posR = maxRC(1) * (r-1);
        posC = maxRC(2) * (c-1);
        
        posGR = (maxRC(1) + guardBands) * (r-1);
        posGC = (maxRC(2) + guardBands) * (c-1);
        
        concatArr(1 + posR : size(cellArr{cellArrPos}, 1) + posR, ...
            1 + posC : size(cellArr{cellArrPos}, 2) + posC) ...
            = cellArr{cellArrPos};
        
        guardBandArr(1 + posGR : size(cellArr{cellArrPos}, 1)+posGR, ...
            1 + posGC : size(cellArr{cellArrPos}, 2)+posGC) ...
            = cellArr{cellArrPos};
    end
end

fprintf("Concatenated Matrix without guardband\n")
fprintf("Dimensions M = %d, N = %d\n", size(concatArr))
disp(concatArr)
% imshow(concatArr, [])

fprintf("Concatenated Matrix with guardband columns and rows\n")
fprintf("Dimensions M = %d, N = %d\n", size(guardBandArr))
disp(guardBandArr)
% figure, handle = imshow(guardBandArr, []);