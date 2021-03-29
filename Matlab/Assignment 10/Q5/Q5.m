clear;

THzFileBasePath = fullfile("datafiles");
THzFiles = dir(THzFileBasePath);
THzFiles = THzFiles(3:end);

numFiles = length(THzFiles);

THzNames = string(zeros(numFiles, 1));
freq = zeros(numFiles, 1);
colsMatCell = cell(numFiles, 1);
scalarSums = zeros(numFiles, 1);

for it = 1:numFiles
    THzNames(it) = THzFiles(it).name;
    freq(it) = str2double(THzFiles(it).name(1:3));
    
    colsMatCell{it} = extractColsTHz(fullfile(THzFileBasePath, THzNames(it)));
    disp(colsMatCell{it})
    
    % sum(((P.^2) .* R) + Q)
    P = colsMatCell{it}(1,:); Q = colsMatCell{it}(2,:); R = colsMatCell{it}(4,:);
    scalarSums(it) = sum(((P.^2) .* R) + Q);
end
disp(scalarSums)

scSumsFile = fopen(fullfile("Q5", "ScalarSum.txt"), "w");

fprintf(scSumsFile, "%9s \t %14s\n", "frequency", "scalar sum");
fprintf(scSumsFile, "%9.2f \t %14.8f\n", [freq'; scalarSums']);

fclose(scSumsFile);