% Conjugate gradient method  

clc ;
clear all ;
n = 6 ;  % Number of equation 
for i=1:n
    sum = 0 ;
    for j=1:n 
        A(i,j) = 1/(i+j-1);
        sum = sum + A(i,j) ; 
    end
    b(i,1) = sum  ;
end  
tol = [1e-8 1e-9 1e-10 1e-11] ; 
for t = 1:4 
    x_0 = zeros(n,1) ;          
    fun_eval = 0 ;
    r_0 = b - A*x_0 ;                   fun_eval = fun_eval + n*n ;
    s_0 = r_0 ; 
    Max_ite = 100 ;
    M = 1 ;
    
    while M<Max_ite
        alf_0 = (r_0'*s_0)/(s_0'*A*s_0) ; fun_eval = fun_eval + n*n+n+n+1 ;
        x_1 = x_0 + alf_0*s_0 ;           fun_eval = fun_eval + n ;
        r_1 = r_0 - alf_0*A*s_0 ;         fun_eval = fun_eval + n*n+n ;
        beta = (r_1'*r_1)/(r_0'*r_0) ;    fun_eval = fun_eval + n+n+1 ;
        s_1 = r_1 + beta*s_0 ;            fun_eval = fun_eval + n ;
        Res(M) = max(abs(r_1)) ;    % norm infinaite 
        error = max(abs(x_1 - x_0))/max(abs(x_1)) ; 
        if Res(M)<tol(t)
            break
        end
        M = M+1 ;  
        x_0 = x_1 ;
        s_0 = s_1 ;
        r_0 = r_1 ;   
    end 
    fprintf("For tolerance = %d\n",tol(t))
    fprintf("value of x is \n")
    for i=1:n
        fprintf("x_%d = %0.6f\n",i,x_0(i))
    end
    fprintf("Total no. of iteration  = %d\n",M)
    fprintf("Function evatuation = %d\n",fun_eval)
    fprintf("___________________________________________________\n")
end 
it=1:M ;
plot(it,Res(it),"r",LineWidth=2) 
xlabel("Iteration")
ylabel("Residual")
title("Iteration vs Residual") 











