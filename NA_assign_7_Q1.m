clc;
clear all ;

Q_no = input('Enter Question number (a, b, or c): ', 's');  % Input as string

switch Q_no
    case 'a'
        fun = @(x) x^3 - 2*x - 5;
    case 'b'
        fun = @(x) x*sin(x) - 1;
    case 'c'
        fun = @(x) exp(-x) - x;
    otherwise
        disp('Invalid value');
        return;  % Exit if invalid input
end
x_0 =  input("Enter initial guess x_0 = "); 
tolerance = input("Enter tolerance = ") ;
Max_it = 1000 ;
delt_x = 1e-6 ;
count  = 0 ;
k = 0 ;
fprintf("Iteration\t x\t\t function evaluation\tError(h)\n")
while k<Max_it 
    f = fun(x_0) ;     count = count+1 ;   
    df = ( fun(x_0 + delt_x) - fun(x_0 - delt_x) )/(2*delt_x) ; count = count+2 ; 
    h = -f/df ;
    x_1 = x_0 + h ; 
    error = abs(h) ;
    x_0 = x_1 ;
    k=k+1 ;
    fprintf("\t%d\t %0.6f\t\t %d\t\t\t\t %0.6f\n",k,x_1,count,error)
    if error<tolerance
        break
    end 
end 

fprintf("x = %0.6f\n",x_1)
fprintf("function evaluation = %d\n",count) 

