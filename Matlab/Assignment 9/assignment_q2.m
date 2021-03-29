clear;
% Assignment Q2
sz = randi(6, [1 2]) + 6;
fprintf("Dimensions: M = %d, N = %d\n", sz);
mat = randi(11, sz) - 1;
disp(mat)

diff = sz(1) - sz(2);
absdiff = abs(diff);
fprintf("abs(sz(1) - sz(2)) = %d\n", absdiff);
crop = floor(absdiff / 2);

max_size = max(sz);
min_size = min(sz);
res_mat1 = zeros(max_size);
res_mat2 = zeros(max_size);

if diff == 0
    res_mat1 = mat;
    res_mat2 = mat;
else
    if diff < 0
        mat = mat.';
    end
    res_mat1(:,crop+1:min_size+crop) = mat(:,1:min_size);
    res_mat2(:,crop+1:min_size+crop) = mat(:,1:min_size);
    for iter = 1:crop
       res_mat1(:,crop-iter+1) = mean(res_mat1(:,crop-iter+2));
       res_mat1(:,min_size+crop+iter) = mean(res_mat1(:, ...
           min_size+crop+iter-1));
       for i = 1:max_size
          if i==1
             res_mat2(i,crop-iter+1) = mean(res_mat2(i:i+1,crop-iter+2));
             res_mat2(i,min_size+crop+iter) = mean(res_mat2(i:i+1, ...
                 min_size+crop+iter-1));
          elseif i==max_size
             res_mat2(i,crop-iter+1) = mean(res_mat2(i-1:i,crop-iter+2));
             res_mat2(i,min_size+crop+iter) = mean(res_mat2(i-1:i, ...
                 min_size+crop+iter-1));
          else
             res_mat2(i,crop-iter+1) = mean(res_mat2(i-1:i+1,crop-iter+2));
             res_mat2(i,min_size+crop+iter) = mean(res_mat2(i-1:i+1, ...
                 min_size+crop+iter-1));
          end  
       end
    end
    if rem(absdiff,2) ~= 0
        res_mat1(:,min_size+(2*crop)+1) = mean(res_mat1(:, ...
            min_size+(2*crop)));
        for i = 1:max_size
           if i==1
              res_mat2(i,min_size+(2*crop)+1) = mean(res_mat2(i:i+1, ...
                  min_size+(2*crop)));
           elseif i==max_size
              res_mat2(i,min_size+(2*crop)+1) = mean(res_mat2(i-1:i, ...
                  min_size+(2*crop)));
           else
              res_mat2(i,min_size+(2*crop)+1) = mean(res_mat2(i-1:i+1, ...
                  min_size+(2*crop)));
           end  
        end
    end
    if diff < 0
        res_mat1 = res_mat1.';
        res_mat2 = res_mat2.';
    end
end

fprintf("Resultant square matrices after appending elements with mean\n")
disp(res_mat1)
disp(res_mat2)
fprintf("Size of resultant matrix = %d x %d\n", size(res_mat1))