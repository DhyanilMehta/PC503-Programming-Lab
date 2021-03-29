function [freq, scalarSums] = scalarSumTHz(THzFiles, THzFileBasePath)
% THzNames = string(zeros(numFiles, 1));
numFiles = length(THzFiles);
freq = zeros(numFiles, 1);
colsMatCell = cell(numFiles, 1);
scalarSums = zeros(numFiles, 1);

for it = 1:numFiles
    if THzFiles(it).name(4) == "_"
        continue
    end
    freq(it) = str2double(THzFiles(it).name(1:3));
    
    colsMatCell{it} = extractColsTHz(fullfile(THzFileBasePath, THzFiles(it).name));
    disp(colsMatCell{it})
    
    % sum(((P.^2) .* R) + Q)
    P = colsMatCell{it}(1,:); Q = colsMatCell{it}(2,:); R = colsMatCell{it}(4,:);
    scalarSums(it) = sum(((P.^2) .* R) + Q);
end
freq = freq(freq ~= 0);
scalarSums = scalarSums(scalarSums ~= 0);
end

