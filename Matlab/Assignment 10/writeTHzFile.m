function writeTHzFile(headingsArr, filePathWithName, valueMatTr)
%WRITETHZFILE 
% Writes a THz file in a particular format with values not having trailing zeros

fileID = fopen(filePathWithName, "w");

fprintf(fileID, "%s\n", headingsArr);
fprintf(fileID, "%13d %14.3g %14.1g %14.7g %14.3g %14.6g %14.6g %14.3g %14.6g\n", valueMatTr);

fclose(fileID);
end