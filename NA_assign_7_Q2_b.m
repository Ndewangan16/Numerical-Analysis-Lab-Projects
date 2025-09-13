clc;
clear all;

function value = fun(x)
    f1 = x(1) + 10*x(2) ;
    f2 = sqrt(5)*( x(3) - x(4) );
    f3 = ( x(2)- x(3) )^2;
    f4 = sqrt(10)*( x(1) - x(4) )^2 ;
    value = [f1 f2 f3 f4]' ;
 end


tolerance = [1e-3 1e-6 1e-9];
for t=1:3
    x_0 = [1 2 1 1]';
    Max_it = 100 ;
    count = 0 ;
    k = 1 ;
    h = 0.005 ;
    while k<Max_it
        for i=1:4
            for j=1:4
                X = x_0 ;
                Y = x_0 ;
                X(j) = x_0(j) + h ; 
                Y(j) = x_0(j) - h ; 
                Fx = fun(X);     count=count+1;
                Fy = fun(Y) ;    count=count+1;
                H(i,j) = (Fx(i) - Fy(i)) / (2*h); 
            end
        end
        s = Gauss_elimination(H,fun(x_0)) ;
        x_1 = x_0 - s;
        error(k) = (max(abs(x_1-x_0)))/(max(abs(x_1))) ; 
        if error(k)<tolerance(t)
            break
        end
        x_0 = x_1 ;
        k=k+1 ;
    end 
    fprintf("Value of X is\n")
    fprintf("for tolerance = %d\n",tolerance(t))
    for m=1:4
        fprintf("x_%d = %06f\n",m,x_1(m));
    end
    fprintf("Number of iteration = %d\n",k)
    fprintf("Function evaluation = %d\n",count)
    fprintf("________________________________________________\n")
end



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



