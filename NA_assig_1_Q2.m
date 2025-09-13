% Name - Nikhil Dewangan
% Roll = 244103008
%________________________________________________

%Q2 first 20 Fibonacci number
clc
clear all
fib(1) = 0 ;
fib(2) = 1 ;
for i=3:20
    fib(i) = fib(i-1) + fib(i-2) ;
end
disp("First 20 Fibonacci number")
for i=1:20
    fprintf("%d\t",fib(i));
end   