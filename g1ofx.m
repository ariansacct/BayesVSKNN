function [ g1 ] = g1ofx( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

g1 = -0.5 * (x-mean1)' * inv(cov(class1data)) * (x-mean1) - log(2*pi) - 0.5*log(det(cov(class1data))) + log(0.516);

end