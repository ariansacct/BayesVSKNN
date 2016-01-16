function [features,targets] = data_generator()%(stud_num);
stud_num=4;
%------------------------------------------------------------------
% [features,targets] = data_generator(stud_num)
% DATA_GENERATOR is the function that helps you generate your own
% artificial dataset for Bayesian classification. 
% INPUT variables:
% - stud_num - the last digit of your student number
% OUTPUT variables:
% - features - bidimentional feature vector for two classes of the size
% (3000,2). Rows of the vector are samples, columns are features.
% - targets -  vector of targets of the size (3000,1)
% --------------------------------------------------

% Evgeny Krestyannikov
% krestyan@cs.tut.fi
% Institute of Signal Processing
% Room TE 313


set1_x=randn(1500,1);
set1_y=randn(1500,1);
target1=ones(1500,1);
class1=[set1_x set1_y];

set21_x=2+.2*randn(500,1);
set21_y=1+randn(500,1);
set22_x=.3*randn(1000,1);
set22_y=2+(0.7-stud_num/20)*randn(1000,1);
target2=ones(1500,1)*2;
class2=[set21_x set21_y; set22_x set22_y];




features=[class1; class2];
order=randperm(3000)';
features=features(order,:);
targets=[target1; target2];
targets=targets(order,:);


