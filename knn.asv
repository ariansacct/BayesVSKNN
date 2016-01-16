

rows = size(val_set, 1);
cols = size(train_set, 1);

dists = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        dists(i, j) = calc_dist(val_set(i,:), train_set(j,:));
    end
end


%in indices ba oon Indices ghati nashe!
indices = minn(dists, k);   % in 3 hamoon k=3 ast yani 3 hamsayeye nazdik. in ham bayad bere tooye for

classes = zeros(rows, k);    % in 3 hamoon 3ye balaeie

% disp('debuge kasif shooroo shod2');
% size(classes)

for i = 1:rows
    for j = 1:k     % in 3 hamoon 3ye balaeie
        classes(i, j) = targets_train(indices(i, j));
    end
end


% disp('debuge kasif shooroo shod3');
% classes

%mode vaseye 1 sootoon dorost neshoon nemide
if k==1
    res = classes;
else
    res = (mode(classes'))';
end

% res = (mode(classes'))';

% disp('debuge kasif shooroo shod');
% res

count = 0;
for i = 1:rows
    if res(i, 1) == val_set_targets(i, 1)
        count = count + 1;
    end
end

ccr = double((count / rows) * 100);
error = double(100 - ccr);




% confusion_mat = zeros(2,2);
% for i=1:rows
%     
%     if res(i,1)==val_set_targets(i,1)
%         if res(i,1)==1
%             confusion_mat(1,1,set_no) = confusion_mat(1,1,set_no) + 1;
%         elseif res(i,1)==2
%             confusion_mat(2,2,set_no) = confusion_mat(2,2,set_no) + 1;
%         end
%     
%     elseif res(i,1)~=val_set_targets(i,1)
%         if res(i,1)==1
%             confusion_mat(2,1,set_no) = confusion_mat(2,1,set_no) + 1;
%         elseif res(i,1)==2
%             confusion_mat(1,2,set_no) = confusion_mat(1,2,set_no) + 1;
%         end
%     end
%     
% end

% disp('the confusion matrix:');
% ccr
% error
% confusion_mat

error_mat(1,set_no) = error;