% The Gauss-Seidel Method

clc ;
clear all ; 

A = [0.2 0.1 1 1 0 ; 0.1 4 -1 1 -1 ; 1 -1 60 0 -2 ; 1 1 0 8 4 ; 0 -1 -2 4 700 ] ; 
b = [1 ; 2; 3 ; 4 ; 5 ] ; 
n = size(A,1) ; 
x_0 = zeros(n,1) ; 
Max_it = 100 ;
M = 1;   
fun_evaluation = 0 ;
tol = [1e-3 1e-4 1e-5 1e-6 ];
for t=1:4
    while M<Max_it
        x_1 = x_0 ;
        for i=1:n 
            sum_1 = 0 ;
            sum_2 = 0 ;
            for j=1:i-1 
                sum_1 = sum_1 + A(i,j)*x_1(j) ;
                fun_evaluation = fun_evaluation + 1 ;
            end
            for j=i+1:n
                sum_2 = sum_2 + A(i,j)*x_0(j) ;
                fun_evaluation = fun_evaluation + 1 ;
                
            end
            x_1(i) =  (1/A(i,i))*(-sum_1 - sum_2 + b(i)) ; 
            fun_evaluation = fun_evaluation + 2 ;
        end
        error = max(abs(x_1 - x_0))/max(abs(x_1)) ; 
        if error < tol(t) 
           break
        end
    x_0 = x_1 ;
    M = M+1 ; 
    end
    fprintf("For tolerance = %d\n",tol(t))
    fprintf("Value of x is \n")
    for k=1:n 
        fprintf("x_%d  = %d\n",k,x_0(k)) 
    end 
    fprintf("function evaluation = %d\n",fun_evaluation)
    fprintf("_________________________________________________\n")

end

