% Assignment 6
clc ;
clear all ; 

Qus_no = input('Enter question no. (1 or 2): ', 's');
switch Qus_no
    case '1'
        A = [-4 0 1/2 1/2 ;1/2 -2 0 1/2 ;1/2 1/2 0 0 ; 0 1 1 4] ;
        x_0 = [0 0 0 1]' ; 
    case '2'
        A = [1 -1 0 ; -2 4 -2 ; 0 -1 2] ;
        x_0 = [-1 2 1]' ;   
    otherwise
    error('Invalid input. Choose either 1 or 2.');
end
Normalized_Power(A,x_0)
Invers_iteration(A,x_0) 

function  Normalized_Power(A,x_0) % Normalized Power Iteration
    Max_it = 1000 ;
    for k=1:Max_it 
        y_1 = A*x_0 ;
        x_1 = y_1/max(abs(y_1)) ;
        error = max(abs(x_1-x_0)) ; 
        if error<1e-6
            break
        end 
        x_0 = x_1 ;
    end  
    y = max(abs(y_1)) ; 
    fprintf("Max. eigen value is")
    disp(y)
    disp("Corresponding eigen Vector is ")
    disp(x_1) 
    fprintf("----------------------------------\n") 
end 

function  Invers_iteration(A,x_0)   % Invers iteration 
    Max_it = 1000 ;
    for k=1:Max_it 
        y_1 = Gauss_elimination(A,x_0) ;
        x_1 = y_1/max(abs(y_1)) ;
        error = max(abs(x_1-x_0)) ; 
        if error<1e-6
            break
        end 
        x_0 = x_1 ;
    end  
    y = 1/max(abs(y_1)) ; 
    fprintf("Min. eigen value is")
    disp(y)
    disp("Corresponding eigen Vector is ")
    disp(x_1) 
    fprintf("----------------------------------\n") 
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

