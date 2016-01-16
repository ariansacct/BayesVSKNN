rows = size(features_test, 1);
cols = size(features_train, 1);

dists = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        dists(i, j) = calc_dist(features_test(i,:), features_train(j,:));
    end
end


indices = minn(dists, k);

classes = zeros(rows, k);
for i = 1:rows
    for j = 1:k
        classes(i, j) = targets_train(indices(i, j));
    end
end


if k==1
    res = classes;
else
    res = (mode(classes'))';
end

count = 0;
for i = 1:rows
    if res(i, 1) == targets_test(i, 1)
        count = count + 1;
    end
end

ccr = double((count / rows) * 100);
err = double(100 - ccr);

confusion_mat = zeros(2,2,10);  % 10 be tedad 'k'ha, na be tedade validation setha

for i=1:rows
    
        if res(i,1) == targets_test(i,1)
            if res(i,1) == 1
                confusion_mat(1,1,k) = confusion_mat(1,1,k) + 1;
            elseif res(i,1) == 2
                confusion_mat(2,2,k) = confusion_mat(2,2,k) + 1;
            end
    
        elseif res(i,1) ~= targets_test(i,1)
            if res(i,1) == 1
                confusion_mat(2,1,k) = confusion_mat(2,1,k) + 1;
            elseif res(i,1) == 2
                confusion_mat(1,2,k) = confusion_mat(1,2,k) + 1;
            end
        end
        
end

fprintf(fid, 'k now is %6.2f\n', k);
mat=confusion_mat(:,:,k);
fprintf(fid, 'confusion matrix: \n');
fprintf(fid, '%6.2f\n', mat');
fprintf(fid, 'ccr: \n');
fprintf(fid, '%6.2f\n', ccr);
fprintf(fid, 'err: \n');
fprintf(fid, '%6.2f\n', err);
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');