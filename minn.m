function indexn = minn(A, n)

indexn = zeros(size(A,1), n);

for i = 1: size(A,1)
    
    [Y,I] = sort(A(i,:)); 
    indexn(i,:) = I(1:n);
    
end

end