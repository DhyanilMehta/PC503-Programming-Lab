clear;
% Assignment Q3
sz = randi(7, [1 2]) + 5;
fprintf("Dimensions: M = %d, N = %d\n", sz);
mat = randi(255, sz);

disp(mat)
imshow(mat, [])
old_mat = mat;
mean3elem = 0;
rows = input("Enter target number of rows: ");
cols = input("Enter target number of columns: ");

if rows < sz(1) && cols < sz(2)
    mat = removeRowOrCol(mat, rows, "row");
    mat = removeRowOrCol(mat, cols, "col");
elseif rows > sz(1) && cols > sz(2)
    mean3elem = input("Append rows and columns using mean of 3 elements?" + ...
    "(0 or 1): ");
    mat = addRowOrCol(mat, rows, "row", mean3elem);
    mat = addRowOrCol(mat, cols, "col", mean3elem);
elseif (rows <= sz(1) && cols > sz(2)) || (rows < sz(1) && cols >= sz(2))
    if cols ~= sz(2)
        mean3elem = input("Append columns using mean of 3 elements?" + ...
        "(0 or 1): ");
    end
    mat = addRowOrCol(mat, cols, "col", mean3elem);
    mat = removeRowOrCol(mat, rows, "row");
elseif (rows >= sz(1) && cols < sz(2)) || (rows > sz(1) && cols <= sz(2))
    if rows ~= sz(1)
        mean3elem = input("Append rows using mean of 3 elements?" + ...
        "(0 or 1): ");
    end
    mat = addRowOrCol(mat, rows, "row", mean3elem);
    mat = removeRowOrCol(mat, cols, "col");
else
    fprintf("Target rows and columns are same as of the matrix, so no" + ...
        " modifications are done.\n")
end

fprintf("Dimensions: M = %d, N = %d\n", size(mat));
disp(mat)
imshowpair(old_mat, mat, 'montage')


function mat = addRowOrCol(mat, dim, rowCol, mean3elem)
    if dim < min(size(mat))
        fprintf("Dimension too low to add any row or column\n");
        return
    end
    if rowCol == "col"
        mat = mat.';
    end
    [m, n] = size(mat);
    addVec = abs(m - dim)/2;
    new_mat = zeros([dim n]);
    if mod(abs(m-dim), 2) == 0
        new_mat(addVec + 1:end - addVec, :) = mat; 
    else
        new_mat(ceil(addVec):end - floor(addVec) - 1, :) = mat;
    end
    if mean3elem
        for iter = 1:floor(addVec)
            for i = 1:n
                if i == 1
                    new_mat(floor(addVec)-iter+1, i) = mean(new_mat( ...
                        floor(addVec)-iter+2, i:i+1));
                    new_mat(end-ceil(addVec)+iter, i) = mean(new_mat( ...
                        end-ceil(addVec)+iter-1, i:i+1));
                elseif i == n
                    new_mat(floor(addVec)-iter+1, i) = mean(new_mat( ...
                        floor(addVec)-iter+2, i-1:i));
                    new_mat(end-ceil(addVec)+iter, i) = mean(new_mat( ...
                        end-ceil(addVec)+iter-1, i-1:i));
                else
                    new_mat(floor(addVec)-iter+1, i) = mean(new_mat( ...
                        floor(addVec)-iter+2, i-1:i+1));
                    new_mat(end-ceil(addVec)+iter, i) = mean(new_mat( ...
                        end-ceil(addVec)+iter-1, i-1:i+1));
                end
            end
        end
        if mod(abs(m-dim), 2) ~= 0
            for i = 1:n
                if i == 1
                    new_mat(end, i) = mean(new_mat(end-1, i:i+1));
                elseif i == n
                    new_mat(end, i) = mean(new_mat(end-1, i-1:i));
                else
                    new_mat(end, i) = mean(new_mat(end-1, i-1:i+1));
                end
            end
        end
    else
        for iter = 1:floor(addVec)
            new_mat(floor(addVec)-iter+1, :) = mean(new_mat( ...
                floor(addVec)-iter+2, :));
            new_mat(end-ceil(addVec)+iter, :) = mean(new_mat( ...
                end-ceil(addVec)+iter-1, :));
        end
        if mod(abs(m-dim), 2) ~= 0
            new_mat(end,:) = mean(new_mat(end-1, :));
        end
    end

    mat = new_mat;
    if rowCol == "col"
        mat = mat.';
    end
end

function mat = removeRowOrCol(mat, dim, rowCol)
    if dim > max(size(mat))
        fprintf("Dimension too high to remove any row or column\n");
        return
    end
    if rowCol == "col"
        mat = mat.';
    end
    matSize = size(mat);
    m = matSize(1);
    removeVec = abs(m - dim) / 2;
    if mod(abs(m-dim), 2) == 0
       mat = mat(removeVec + 1:end - removeVec, :); 
    else
       mat = mat(ceil(removeVec):end - floor(removeVec) - 1, :);
    end
    if rowCol == "col"
        mat = mat.';
    end
end