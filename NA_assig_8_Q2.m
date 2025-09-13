clc ;
clear all ;  

L = load("NA_assig_8_Q2_input.txt") ;  
x0 = L(1,1) ; fx0 = L(1,2) ;
x1 = L(2,1) ; fx1 = L(2,2) ;
x2 = L(3,1) ; fx2 = L(3,2) ;
x3 = L(4,1) ; fx3 = L(4,2) ;
x4 = L(5,1) ; fx4 = L(5,2) ;
x5 = L(6,1) ; fx5 = L(6,2) ;

x = 27 ;
f_act = 7.986 ;


% 20 known 20 equation 
A = [x1^3 x1^2 x1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 x1^3 x1^2 x1 1 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 x2^3 x2^2 x2 1 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 x2^3 x2^2 x2 1 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 x3^3 x3^2 x3 1 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 x3^3 x3^2 x3 1 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 x4^3 x4^2 x4 1 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 x4^3 x4^2 x4 1 ;
     x0^3 x0^2 x0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 x5^3 x5^2 x5 1 ;
     3*x1^2 2*x1 1 0 -3*x1^2 -2*x1 -1 -0 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 3*x2^2 2*x2 1 0 -3*x2^2 -2*x2 -1 -0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 3*x3^2 2*x3 1 0 -3*x3^2 -2*x3 -1 -0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 3*x4^2 2*x4 1 0 -3*x4^2 -2*x4 -1 -0 ;
     6*x1 2 0 0 -6*x1 -2 -0 -0 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 6*x2 2 0 0 -6*x2 -2 -0 -0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 6*x3 2 0 0 -6*x3 -2 -0 -0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 6*x4 2 0 0 -6*x4 -2 -0 -0 ;
     6*x0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6*x5 2 0 0 ] ; 

b = [fx1 fx1 fx2 fx2 fx3 fx3 fx4 fx4 fx0 fx5 0 0 0 0 0 0 0 0 0 0 ]' ;   % 20*1 

% Solve system of linear equation Ax = b 
a =  Gauss_elimination(A,b) ;   

if x>=0 && x<=8 
    f_num = a(1)*x^3 + a(2)*x^2 + a(3)*x + a(4) ;
end
if x>8 && x<=16
    f_num = a(5)*x^3 + a(6)*x^2 + a(7)*x + a(8) ;
end
if x>16 && x<=14
    f_num = a(9)*x^3 + a(10)*x^2 + a(11)*x + a(12) ;
end
if x>24 && x<=32
    f_num = a(13)*x^3 + a(14)*x^2 + a(15)*x + a(16) ;
end
if x>32 && x<=40
    f_num = a(17)*x^3 + a(18)*x^2 + a(19)*x + a(20) ;  
end
error = abs(f_act - f_num) ;

fprintf("Numerical value of f(%.2f) = %.8f\n",x,f_num) ;
fprintf("Actual value of f(%.2f) = %.8f\n",x,f_act) ;
fprintf("Absolute error = %.8f\n",error) ;



function result = Gauss_elimination(A,b)
    Ab = [A,b] ;
    n = size(A,1) ; % Number of equation 
    for i=1:n
        % Partial Pivoting
        MR = i ;
        for k=i+1:n
            if abs(Ab(k,i))>abs(Ab(MR,i))
                MR = k ;
            end
        end
        if MR~=i   % change Row
            temp1 = Ab(i,:);
            Ab(i,:) = Ab(MR,:) ;
            Ab(MR,:) = temp1 ; 
        end        
        % Forward subsitution 
        for ii=i+1:n
            cons1 = Ab(ii,i)/Ab(i,i) ;
            Ab(ii,:) = Ab(ii,:) - Ab(i,:)*cons1 ;             
        end
    end 
    % Back Substitution for requied significant digit 
    x = zeros(n,1); 
    for i=n:-1:1
        x(i) = ( Ab(i,end) - Ab(i,i+1:n) * x(i+1:n) )/Ab(i,i) ;    
    end  
    result = x ;
end  