clc;
clear all ;

function fx = fun(x)
    fx = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5 ; 
end


h =input("Enter value of step size h = ") ; 
x = 0.6 ;

df_true = 25 - 200*2*x + 675*3*x^2 - 900*4*x^3 + 400*5*x^4 ;
fprintf("True value of f'(%.2f) = %.8f\n",x,df_true)

% Forward
fdx1 = (fun(x+h) - fun(x) )/h;  
ferror1 = abs(fdx1 - df_true) ;
fdx2 = ( -fun(x+2*h) + 4*fun(x+h) - 3*fun(x) )/(2*h) ;
ferror2 = abs(fdx2 - df_true) ;

fprintf("Forward difference\n")
fprintf("Using method 1 f'(%.2f) = %.8f\n",x,fdx1)
fprintf("Error = %0.8f\n",ferror1)
fprintf("Using method 2 f'(%.2f) = %.8f\n",x,fdx2)
fprintf("Error = %0.8f\n",ferror2)
fprintf("_______________________________________________________\n\n")
% Backward 
bdx1 = ( fun(x) - fun(x-h))/h ;
berror1 = abs(bdx1 - df_true) ;
bdx2 = ( 3*fun(x) - 4*fun(x-h) + fun(x-2*h) )/(2*h) ; 
berror2 = abs(bdx2 - df_true) ;

fprintf("Backward difference\n")
fprintf("Using method 1 f'(%.2f) = %.8f\n",x,bdx1)
fprintf("Error = %0.8f\n",berror1)
fprintf("Using method 2 f'(%.2f) = %.8f\n",x,bdx2)
fprintf("Error = %0.8f\n",berror2)
fprintf("_______________________________________________________\n\n")

% Central
cdx1 = ( fun(x+h) - fun(x-h))/(2*h) ;
cerror1 = abs(cdx1 - df_true) ;
cdx2 = ( -fun(x+2*h) + 8*fun(x+h) - 8*fun(x-h) + fun(x-2*h) )/(12*h) ;
cerror2 = abs(cdx2 - df_true) ;
fprintf("Central difference\n")
fprintf("Using method 1 f'(%.2f) = %.8f\n",x,cdx1)
fprintf("Error = %0.8f\n",cerror1)
fprintf("Using method 2 f'(%.2f) = %.8f\n",x,cdx2)
fprintf("Error = %0.8f\n",cerror2)
 

