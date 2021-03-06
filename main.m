clear all
clc

% a)

% [features,targets] = data_generator();
% 
% inds1 = find(targets == 1);
% class1data = features(inds1,:);
% 
% inds2 = find(targets == 2);
% class2data = features(inds2,:);
% 
% mean1 = mean(class1data);
% std1 = std(class1data);
% 
% mean2 = mean(class2data);
% std2 = std(class2data);
% 
% b)
% 
% train_inds = randsample(1:3000, 1000);
% test_inds = setdiff(1:3000, train_inds);
% 
% features_train = features(train_inds,:);
% features_test = features(test_inds,:);
% 
% targets_train = targets(train_inds,:);
% targets_test = targets(test_inds,:);
% 
% Indices = crossvalind('Kfold', size(features_train,1), 10);
% 
% save data.mat

load data.mat

scatter(class1data(:,1), class1data(:,2));
hold on
scatter(class2data(:,1), class2data(:,2));

pause
hold off

[X,Y] = meshgrid(-3.1790:2.6649, -2.4042:3.4062);


g = zeros(size(X,1), size(Y,1));
for i=1:size(X,1)
    for j=1:size(Y,1)
%         g1 = -0.5 * ( [X(i,j) Y(i,j)] - mean1 )' * inv(cov(class1data)) * ( [X(i,j) Y(i,j)] - mean1 ) - log(2*pi) - 0.5*log(det(cov(class1data))) + log(0.516);
%         g2 = -0.5 * ( [X(i,j) Y(i,j)] - mean2 )' * inv(cov(class2data)) * ( [X(i,j) Y(i,j)] - mean2 ) - log(2*pi) - 0.5*log(det(cov(class2data))) + log(0.484);
        g1 = -0.5 * ( [X(i,j) Y(i,j)] - mean1 ) * inv(cov(class1data)) * ( [X(i,j) Y(i,j)] - mean1 )' - log(2*pi) - 0.5*log(det(cov(class1data))) + log(0.516);
        g2 = -0.5 * ( [X(i,j) Y(i,j)] - mean2 ) * inv(cov(class2data)) * ( [X(i,j) Y(i,j)] - mean2 )' - log(2*pi) - 0.5*log(det(cov(class2data))) + log(0.484);


        g(i,j) = g1 - g2;
%         disp(g1ofx([X(i,j) Y(i,j)]) - g2ofx([X(i,j) Y(i,j)]))
    end
end

% contour(g,0)
% contour(g)

% disp('salam');
contour(X,Y,g,[0 0])







% e)

confidence_matrix = zeros(2,2);

features_res = zeros(2000,1);
for i=1:2000
    g1 = -0.5 * ( features_test(i,:) - mean1 ) * inv(cov(class1data)) * ( features_test(i,:) - mean1 )' - log(2*pi) - 0.5*log(det(cov(class1data))) + log(0.516);
    g2 = -0.5 * ( features_test(i,:) - mean2 ) * inv(cov(class2data)) * ( features_test(i,:) - mean2 )' - log(2*pi) - 0.5*log(det(cov(class2data))) + log(0.484);
    if g1-g2>0
        features_res(i,1) = 1;
        if targets_test(i,1)==1
            confidence_matrix(1,1) = double(confidence_matrix(1,1) + (g1-g2)/g1);
        elseif targets_test(i,1)==2
            confidence_matrix(2,1) = double(confidence_matrix(2,1) + (g1-g2)/g1);
        end
    elseif g2-g1>0
        features_res(i,1) = 2;
        if targets_test(i,1)==1
            confidence_matrix(1,2) = double(confidence_matrix(1,2) + (g2-g1)/g2);
        elseif targets_test(i,1)==2
            confidence_matrix(2,2) = double(confidence_matrix(2,2) + (g2-g1)/g2);
        end
    end
end

res = (features_res == targets_test);
tabulate(res)


confusion_matix = zeros(2,2);
% confidence_matix = zeros(2,2);

for i=1:2000
    
    if features_res(i,1)==targets_test(i,1)
        if features_res(i,1)==1
            confusion_matix(1,1) = confusion_matix(1,1) + 1;
        elseif features_res(i,1)==2
            confusion_matix(2,2) = confusion_matix(2,2) + 1;
        end
    
    elseif features_res(i,1)~=targets_test(i,1)
        if features_res(i,1)==1
            confusion_matix(2,1) = confusion_matix(2,1) + 1;
        elseif features_res(i,1)==2
            confusion_matix(1,2) = confusion_matix(1,2) + 1;
        end
    end
    
end










% f)

[fid,message] = fopen('C:\Users\Arian\Documents\MATLAB\CA2\res_f.txt', 'r+');

% Indices = crossvalind('Kfold', size(features_train,1), 10);


k_errors = zeros(1,10);

for k=1:10
    
    error_mat = zeros(1,10);
    
%     confusion_mat = zeros(2,2,10);
    
    for set_no=1:10
        
        val_set_inds = find(Indices == set_no);   % in 8 mire to for (jash andise halghe miyad) -- MOHEM: statemente balayee bayad ghable for bashe
        train_set_inds = find(Indices ~= set_no);

        val_set = features_train(val_set_inds,:);
        train_set = features_train(train_set_inds,:);

        val_set_targets = targets_train(val_set_inds,:);
        train_set_targets = targets_train(train_set_inds,:);


        knn
        
        disp(['set_no = ',num2str(set_no)]);
        error_mat
        
    end
    
    ccr_mat = 1 - error_mat;
    
    k_errors(1,k) = mean(error_mat);
    
    disp(['k = ',num2str(k)]);
    k_errors
    
    
    
    
    % knn2 be jaye in chand khatte paeen
    
    knn2
    
%     for i=1:rows
%     
%         if res(i,1)==val_set_targets(i,1)
%             if res(i,1)==1
%                 confusion_mat(1,1,set_no) = confusion_mat(1,1,set_no) + 1;
%             elseif res(i,1)==2
%                 confusion_mat(2,2,set_no) = confusion_mat(2,2,set_no) + 1;
%             end
%     
%         elseif res(i,1)~=val_set_targets(i,1)
%             if res(i,1)==1
%                 confusion_mat(2,1,set_no) = confusion_mat(2,1,set_no) + 1;
%             elseif res(i,1)==2
%                 confusion_mat(1,2,set_no) = confusion_mat(1,2,set_no) + 1;
%             end
%         end
%         
%     end
    
end

[min_error opt_k] = min(k_errors);



fclose(fid);




% g)

[fid2,message] = fopen('C:\Users\Arian\Documents\MATLAB\CA2\res_g.txt', 'r+');

e_k = zeros(1,10);
c_matrix = zeros(2,2,10);

for k=1:10
    class = knnclassify(features_test, features_train, targets_train, k);
%     natije = (class == targets_test);
%     tabulate(natije);

    knn3


end


fclose(fid2);