clc;
clear all;

A = load("NA_assig_8_Q3_input.txt") ;   
x_data = A(:,1) ; 
fx_data = A(:,2) ;
x = [x_data(1) x_data(3) x_data(5) x_data(7)] ;
fx = [fx_data(1) fx_data(3) fx_data(5) fx_data(7) ] ;

X = 3.5;

function result =  Lagrange(X,x,fx)
    sum = 0 ;
    for i=1:4
        mul = 1 ; 
        for j=1:4  
            if j~=i  
                mul = mul * ( (X-x(j))/(x(i)-x(j)) ) ;
                L(i) = mul ;
            end
           
        end
        sum = sum + L(i)*fx(i) ;
    end 
    result = sum ; 
end

f_num = Lagrange(X,x,fx);
fprintf("Value of f(%.2f) = %f\n",X,f_num)  

% Calculate absolute error at each given data point  
n = length(x_data) ; 
for k=1:n
    error(k) = abs(fx_data(k) - Lagrange(x_data(k),x,fx)) ;
    fprintf('At x = %.2f, Absolute Error = %f\n', x_data(k), error(k));
end



