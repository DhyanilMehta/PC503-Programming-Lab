clear;
% Assignment Q1
sz = randi(7, [1 2]) + 5;
fprintf("Dimensions: M = %d, N = %d\n", sz);
mat = randi(12, sz);
disp(mat)

diff = sz(1) - sz(2);
absdiff = abs(diff);
fprintf("abs(sz(1) - sz(2)) = %d\n", absdiff);
floor_half_diff = floor(absdiff / 2);
ceil_half_diff = ceil(absdiff / 2);

if diff == 0
    res_mat = mat;
else
    if diff > 0
        mat = mat.';
    end
    if mod(absdiff, 2) == 0
            res_mat = mat(:, ceil_half_diff + 1 : end - floor_half_diff);
    else
            res_mat = mat(:, ceil_half_diff : end - floor_half_diff - 1);
    end
    if diff > 0
        res_mat = res_mat.';
    end
end

fprintf("Resultant square matrix after cropping elements\n")
disp(res_mat)
fprintf("Size of resultant matrix = %d x %d\n", size(res_mat))
