clc ;
clear all ;

function value = fun(t,y)
    k = 0.06 ; 
    value = -k*sqrt(y) ;
end 
function result = exact_fun(t)
    k = 0.06 ; 
    result = ( sqrt(3) - k*t/2)^2 ;
end
h = input("Enter value of step size h = ");
t_0 = 0 ; 
y_0 = 3 ; 
RK4(t_0,y_0,h)

function RK4(t_0,y_0,h)
    fprintf("Time\t y-RK4\t y-Heun\t\t y_exact\t  percentage Relative error in y(RK4)\n")
    y_heun = Heuns_method(t_0,y_0,h) ;  
    N = length(y_heun);
    count = 0 ;
    a=1;
    while y_0>0 
        k1 = fun(t_0,y_0);                  
        k2 = fun(t_0+0.5*h,y_0+0.5*k1*h); 
        k3 = fun(t_0+0.5*h,y_0+0.5*k2*h);  
        k4 = fun(t_0+h,y_0+k3*h);           
        y_1 = y_0 + (h/6)*(k1 + 2*k2 + 2*k3 + k4) ;   
        count = count+4 ;
       if y_1<0
           break
       end
       y_0 = y_1 ;
       t_0 = t_0 + h ;
       if a>N
           y_heun(a)=0;
       end
       y_exact = exact_fun(t_0);
       rel_error = 100*abs( (abs(y_0) - abs(y_exact))/abs(y_exact)) ;
       fprintf("%.2f  %.8f  %.8f  %.8f  %.8f\n",t_0,y_0,y_heun(a),y_exact,rel_error)
       a=a+1;
    end    
    k=0.06;
    t_exact = 57.73502692 ;
    time_error = abs((t_exact - (t_0))/t_exact)*100;
    fprintf("Tank to drain time = %.4f sec\n",t_0)    
    fprintf("No. of function evaluations %d\n",count)
    fprintf("percentage relative error in time (RK4) = %.8f\n",time_error)
    fprintf("__________________________________________________\n")
    
end 

function result= Heuns_method(t_0,y_0,h)
    %fprintf("Heun's Method\n")
    a=1;
    count = 0 ;
    %fprintf("Time \t\t y_numarical\t y_exact\t Relative error(y)\n")
    while y_0>0
        t_1 = t_0 + h ;
        y_1p = y_0 + h*fun(t_0,y_0) ;   count = count+1 ;
        y_1c = y_0 + (h/2)*(fun(t_0,y_0) + fun(t_1,y_1p));  count = count+2;
        e = abs((abs(y_1c) - abs(y_1p))/y_1c) ;
        while e>0.0001 
            y_1 = y_0 + (h/2)*(fun(t_0,y_0) + fun(t_1,y_1c)); 
            e = abs((abs(y_1) - abs(y_1c))/y_1) ;
            y_1c = y_1 ; 
        end 
        y_1 = y_1c ;
        if y_1<0
               break
        end
        y_0 = y_1 ;
        t_0 = t_1 ; 
        result(a) = y_0;
        a=a+1;
        y_exact = exact_fun(t_0);
        rel_error = 100*abs( ((y_0) - (y_exact))/(y_exact)) ;
        %fprintf("%.2f\t  %.8f\t\t %.8f\t %.4f\n",t_0,y_0,y_exact,rel_error)
    end
    % fprintf("Tank to drain time = %.4f sec \n",t_0)
    % fprintf("No. of function evaluations %d\n",count)
    % t_exact = 57.73502692 ;
    % time_error = abs((t_exact - (t_0))/t_exact)*100;
    % fprintf("Percentage relative error = %.8f\n",time_error)
end
