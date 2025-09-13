clc ;
clear all ;

A = load("NA_assign_10_Q1_input.txt") ;
x = A(:,1);
y = A(:,2); 

traprzoidal(x,y) 
combination(x,y)

function traprzoidal(x,y)
     fprintf("Trapezoidal rule\n")
    I_trap = 0 ;
    n= length(x) ;
    for i = 1:n-1 
        I_trap = I_trap +  0.5 * (x(i+1) - x(i) )*( y(i) + y(i+1)) ;
    end
    
    I_true = 0.79124045368 ; 
    
    % relative error with respect to true value 
    error = 100 * (abs(I_trap - I_true)/I_true) ; 
    
    fprintf("I_true = %.8f\n",I_true)
    fprintf("I_trap = %.8f\n",I_trap)
    fprintf("Percentage relative error = %f\n",error) 
    fprintf('________________________________________________\n')
end

function combination(x,y)
    fprintf("Combination mathod\n")
    % fast 2 data equal step size (tapezoidal rule) 
    h1 = x(2)-x(1) ;
    I1 = 0.5*h1*( y(1) + y(2) ) ;
    
    % 2-5 data equal step size (simpson 3/8)  
    h2 = x(3)-x(2);
    I2 = (3*h2/8)*(y(2) + y(5) + 3*y(3) + 3*y(4)  ) ;
    
    % 5-7 data  (simson 1/3)
    h3 = x(6)-x(5) ;
    I3 = (h3/3)*( y(5) + y(7) + 4*y(6) ) ;
    
    
    
    I = I1 + I2 + I3  ;  
    I_true = 0.79124045368 ; 
    
    % relative error with respect to true value 
    error = 100 * abs(I - I_true)/I_true ; 
    
    fprintf("I_true = %.8f\n",I_true)
    fprintf("I_numerical = %.8f\n",I)
    fprintf("Percentage relative error = %.8f\n",error) 
end

 