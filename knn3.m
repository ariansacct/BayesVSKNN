rows = size(features_test, 1);

ctr = 0;
for i = 1:rows
    if class(i, 1) == targets_test(i, 1)
        ctr = ctr + 1;
    end
end

ccr = double((ctr / rows) * 100);
err = double(100 - ccr);

e_k(1,k) = err;



for i=1:2000

        if class(i,1)==targets_test(i,1)
            if class(i,1)==1
                c_matrix(1,1,k) = c_matrix(1,1,k) + 1;
            elseif class(i,1)==2
                c_matrix(2,2,k) = c_matrix(2,2,k) + 1;
            end

        elseif class(i,1)~=targets_test(i,1)
            if class(i,1)==1
                c_matrix(2,1,k) = c_matrix(2,1,k) + 1;
            elseif class(i,1)==2
                c_matrix(1,2,k) = c_matrix(1,2,k) + 1;
            end
        end

end

fprintf(fid2, 'k now is %6.2f\n', k);
mat=c_matrix(:,:,k);
fprintf(fid2, 'confusion matrix: \n');
fprintf(fid2, '%6.2f\n', mat');
fprintf(fid2, 'ccr: \n');
fprintf(fid2, '%6.2f\n', 100-e_k(1,k));
fprintf(fid2, 'err: \n');
fprintf(fid2, '%6.2f\n', e_k(1,k));
fprintf(fid2, '\n');
fprintf(fid2, '\n');
fprintf(fid2, '\n');
fprintf(fid2, '\n');
fprintf(fid2, '\n');