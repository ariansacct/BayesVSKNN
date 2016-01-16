function [ g2 ] = g2ofx( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

g2 = -0.5 * (x-mean2)' * inv(cov(class2data)) * (x-mean2) - log(2*pi) - 0.5*log(det(cov(class2data))) + log(0.484);

end