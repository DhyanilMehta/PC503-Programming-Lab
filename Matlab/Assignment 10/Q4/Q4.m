clear;
Thz03Path = fullfile("datafiles", "0.3THz.txt");
Thz04Path = fullfile("datafiles", "0.4THz.txt");

colsMat03 = extractColsTHz(Thz03Path); % Matrix values are in transposed form
colsMat04 = extractColsTHz(Thz04Path); % as compared to the arrangement in file

subsMat = colsMat03(4:end, :) - colsMat04(4:end, :);

subsID = fopen(fullfile("Q4", "Subs.txt"), "w");

fprintf(subsID, "%15s %15s %15s %15s %15s %15s  \n", "HxRe [A/m]", "HyRe [A/m]", ...
    "HzRe [A/m]", "HxIm [A/m]", "HyIm [A/m]", "HzIm [A/m]");
fprintf(subsID, "%s", repelem("-", 100));
fprintf(subsID, "\n");
fprintf(subsID, "%15.7f %15.3f %15.6f %15.6f %15.3f %15.6f\n", subsMat);

fclose(subsID);
