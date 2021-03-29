function colsMat = extractColsTHz(tHzFilePath)
fileID = fopen(tHzFilePath);
fgetl(fileID); fgetl(fileID);

colsMat = fscanf(fileID, "%f %f", [9 10]);

fclose(fileID);
end