clear;

THzFileBasePath = fullfile("Q1", "Inputs", "datafiles");
THzFiles = dir(THzFileBasePath);
THzFiles = THzFiles(3:end);

[freq, scalarSums] = scalarSumTHz(THzFiles, THzFileBasePath);
disp(scalarSums)

scSumsFile = fopen(fullfile("Q1", "Outputs", "ScalarSum.txt"), "w");

fprintf(scSumsFile, "%9s \t %14s\n", "frequency", "scalar sum");
fprintf(scSumsFile, "%9.2f \t %14.8f\n", [freq'; scalarSums']);

fclose(scSumsFile);
