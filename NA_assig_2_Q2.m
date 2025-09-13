% Name - Nikhil Dewangan 
% Roll no. - 244103008 
% Q2 - Horner’s algorithm 
%_______________________________________________________________
clc ;
clear all ;
n = input("Enter number of terms n = ") ;   
X = input("Enter value of x in degree = " ) ; 
x = X*pi/180 ; %  Degree to Rrdian 

% Actual value of sin(x)
f_actual = sin(x) ; 

% make factorial function 
function fun = factorial(k)
    fun = 1 ;
    for i=1:k
        fun = fun*i;
    end
end   

% Taylor series for calculation sin(x) 
f_xt = 0 ;
for i=1:n 
    sin_x = ((-1)^(i-1))*(x^(2*i-1))/factorial(2*i-1) ; 
    f_xt  = f_xt  + sin_x ;
end 

% Horner's method for for calculation sin(x) 
f_xh = x ;
value_1 = x ;
sign = -1 ;
for i=1:n-1
    value_1 = value_1 * (x^2 / ((2*i)*(2*i + 1 ))) ; 
    f_xh = f_xh + sign * value_1 ;
    sign = -sign ;
end

% Error calculation 
error_taylor = abs( (f_xt - f_actual)/f_actual ) ;
error_hoener = abs( (f_xh - f_actual)/f_actual ) ;  

% Comparing Arithmetic Operations
operations_t = n*(2+3)+(n - 1)*2; % n multiplications, n additions, (n-1) subtractions, n divisions
operations_h = n-1+(n-1); % (n-1) multiplications and (n-1) additions


fprintf("Actual value of sin(x) is: %0.9f\n", f_actual);
fprintf("Value of sin(x) using Taylor Series = %0.9f\n", f_xt);
fprintf("Value of sin(x) using Horner's Method = %0.9f\n", f_xh);
fprintf("Relative error in Taylor Series is  = %0.9f\n", error_taylor);
fprintf("Relative error in Horner's Method is = %0.9f\n", error_hoener);
fprintf("Number of arithmetic operations using Taylor Series: %d\n", operations_t);
fprintf("Number of arithmetic operations using Horner's Method: %d\n", operations_h);





