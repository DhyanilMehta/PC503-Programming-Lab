function findAndWriteDuplicateRowsTHz(THzFiles, InpPath, OutPath)
for i = 1:length(THzFiles)-1
    valMat1 = extractColsTHz(fullfile(InpPath, THzFiles(i).name));
    
    for j = i+1:length(THzFiles)
        valMat2 = extractColsTHz(fullfile(InpPath, THzFiles(j).name));
        cmp = floor(abs(valMat1 - valMat2));
        duplIndices = find(all(cmp==0));
        
        if isempty(duplIndices)
            continue
        end
        fprintf("Duplicate rows between %s and %s\n", THzFiles(i).name, THzFiles(j).name);
        fprintf("%s rows:\n", THzFiles(i).name);
        disp(valMat1(:,duplIndices))
        fprintf("%s rows:\n", THzFiles(j).name);
        disp(valMat2(:,duplIndices))
        
        [head1, head2] = extractHeadingsTHz(fullfile(InpPath, THzFiles(i).name));
        duplRows = valMat2(:, duplIndices); % Can also be valMat1(:, duplIndices)
        
        
        if THzFiles(i).name(4) == '_' && THzFiles(j).name(4) == '_'
            newFName = THzFiles(i).name(1:5) + "match" + THzFiles(j).name(1:5) + "THz.txt";
        elseif THzFiles(i).name(4) == '_'
            newFName = THzFiles(i).name(1:5) + "match" + THzFiles(j).name(1:3) + "THz.txt";
        else
            newFName = THzFiles(i).name(1:3) + "match" + THzFiles(j).name(1:5) + "THz.txt";
        end
        newFPath = fullfile(OutPath, newFName);
        writeTHzFile([head1;head2], newFPath, duplRows);
    end
end
end

