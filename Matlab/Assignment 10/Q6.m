clear;
datafilesPath = fullfile("datafiles");
Thz03Path = fullfile(datafilesPath, "0.3THz.txt");
Thz04Path = fullfile(datafilesPath, "0.4THz.txt");

[head1,head2] = extractHeadingsTHz(Thz03Path);

mat03 = extractColsTHz(Thz03Path);
mat04 = extractColsTHz(Thz04Path);

lastrowsInter = 5;

tmp = mat03;
mat03(:, end-(lastrowsInter-1) : end) = mat04(:, end-(lastrowsInter-1) : end);
mat04(:, end-(lastrowsInter-1) : end) = tmp(:, end-(lastrowsInter-1) : end);
clear tmp;

writeTHzFile([head1;head2], fullfile("datafiles", "0.3_1THz.txt"), mat03);
writeTHzFile([head1;head2], fullfile("datafiles", "0.4_1THz.txt"), mat04);
