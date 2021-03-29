clear;
%% Making empty folders Q1(a)
N = 3; % Number of subdirectory levels
subDirs = zeros(N,1); % For storing number of subdirectories at each level
levelFldrs = cell(N,1);

for lvl_id = 1:N
    subDirs(lvl_id) = randi([2, 2^(1+lvl_id)]);
    levelFldrs{lvl_id} = string(zeros(subDirs(lvl_id), 1));
    for n = 1:subDirs(lvl_id)
        levelFldrs{lvl_id}(n) = strcat("fldr", int2str(lvl_id), int2str(n));
    end
    disp(subDirs)
    disp(levelFldrs{lvl_id})
end

% Keep current folder as its parent folder for this to work
basePath = fullfile("Q1", "assgnmnt_folder");

makeFolders(1, N, basePath, levelFldrs);

rmpath(genpath(basePath));
addpath(genpath(basePath));

%% Counting the number of directories generated Q1(b)
M = 1;
for lvl_id = 1:N
    M = M * subDirs(lvl_id);
end
fprintf("No. of subdirectories generated: %d\n", M);

%% Copying files from mixed_files folder to generated folders Q1(c)
% basePath = "./assgnmnt_folder";
mfPath = fullfile(basePath, "mixed_files");
mfFiles = dir(mfPath);
mfFiles(1) = []; mfFiles(1) = []; % Remove '.' and '..' elements

copyIntoFolders(basePath, mfFiles, mfPath, 1, N, 0);

%% Functions
function makeFolders(lvl, maxLvl, parentPath, cellFldrs)
    if lvl > maxLvl || lvl <= 0
        return
    end
    for i = 1:length(cellFldrs{lvl})
        mkdir(parentPath, cellFldrs{lvl}(i));
        if lvl == maxLvl
            continue
        end
        fldrPath = fullfile(parentPath, cellFldrs{lvl}(i));
        makeFolders(lvl+1, maxLvl, fldrPath, cellFldrs);
    end
end

function fileNum = copyIntoFolders(destPath, mfFiles, mfFilesPath, lvl, N, fileNum)
    destFldrs = dir(destPath);
    lengthFldrs = length(destFldrs);
    
    if lengthFldrs <= 2 || lvl > N || lvl <= 0
        return
    end
    
    for i = 3:lengthFldrs
        if destFldrs(i).name == "mixed_files" || ~destFldrs(i).isdir
            continue
        end
        disp(destFldrs(i).name)
        destSubPath = fullfile(destPath, destFldrs(i).name);
        fprintf("Before loop: Level=%d fileNum=%d\n", lvl, fileNum);
        for j = 1:2*lvl
            fprintf("mfIdx(%d) = %d, Name = %s\n", fileNum, mfIdx(fileNum), ...
               mfFiles(mfIdx(fileNum)).name);
            fileToCopyPath = fullfile(mfFilesPath, mfFiles(mfIdx(fileNum)).name);
            disp(destSubPath)
            copyfile(fileToCopyPath, destSubPath);
            fileNum = fileNum + 1;
        end
        fprintf("After loop: Level=%d fileNum=%d\n\n", lvl, fileNum);
        fileNum = copyIntoFolders(destSubPath, mfFiles, mfFilesPath, lvl+1, N, fileNum);
        
    end
end

function idx = mfIdx(val)
    idx = mod(val, 20) + 1;
end