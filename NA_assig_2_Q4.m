% Name - Nikhil Dewangan 
% Roll no. - 244103008 
% Q4 - Write a code to compute matrix-vector multiplication of any given size.. 
%____________________________________________________________________
clc;
clear;

A = input('Enter the matrix A : ');  % Example: [a b c; d e f; g h i]
v = input('Enter the vector v: '); % Example: [p; q; r] 
disp("A is") ; disp(A) ;
disp("v is") ; disp(v) ;

[m, n] = size(A);
if length(v) ~= n
    error("Given valid dimension of matrix and vector.");
end

mult = zeros(m, 1);
for i = 1:m
    for j = 1:n
        mult(i) = mult(i) + A(i, j) * v(j);
    end
end

disp("The result of A*v is:");
disp(mult);
