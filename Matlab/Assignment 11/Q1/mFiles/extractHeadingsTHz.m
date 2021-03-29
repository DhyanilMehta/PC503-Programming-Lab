function [h1,h2] = extractHeadingsTHz(THzFilePath)
%EXTRACTHEADINGSTHZ
% Extracts the headings including break line from THz file
fileID = fopen(THzFilePath);
h1 = fgetl(fileID);
h2 = fgetl(fileID);
h1 = string(h1);
h2 = string(h2);
fclose(fileID);
end