clear;
InputPath = fullfile("Q1", "Inputs", "datafiles");
OutputPath = fullfile("Q1", "Outputs");
THzFiles = dir(InputPath);
THzFiles = THzFiles(3:end);

for i = 1:length(THzFiles)-2
    if THzFiles(i).name == "0.3THz.txt" || THzFiles(i).name == "0.4THz.txt"
        THzFiles(i) = [];
    end
end

findAndWriteDuplicateRowsTHz(THzFiles, InputPath, OutputPath);
