clc ;
clear ;  
A = [2 1 1 0 ; 4 3 3 1 ; 8 7 9 5 ; 6 7 9 8 ] ;
b = [4 ; 6 ; 8 ; -2] ;
n = size(A,1) ; % Number of equation 
Ab = [A,b] ;   % Augment A with b 
D = input("Enter no. for requied significant digit  = ") ;
fprintf("Augment matrix A with b\n") ;
disp(Ab)

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
fprintf("Upper triangular matrix is \n")
disp(Ab)

% Back Substitution for 10 significant digit
x_act = zeros(n,1); 
for i=n:-1:1
    x_act(i) = ( Ab(i,end) - Ab(i,i+1:n) * x_act(i+1:n) )/Ab(i,i) ; 
    x_act(i) = significant_digit(x_act(i),10) ;
    
end 
disp("Value of x for 10 significant digits ")
for i=1:n
    fprintf("X_%d = %0.3f\n",i,x_act(i))
end 



% Back Substitution for requied significant digit 
x = zeros(n,1); 
for i=n:-1:1
    x(i) = ( Ab(i,end) - Ab(i,i+1:n) * x(i+1:n) )/Ab(i,i) ; 
    x(i) = significant_digit(x(i),D) ;
    
end 
fprintf("Value of x for %d significant digit is \n",D)
for i=1:n
    fprintf("X_%d = %0.3f\n",i,x(i))
end  

norm_2 = 0 ;
for i=1:n
    norm_2 = norm_2 + (x(i) - x_act(i))^2 ; 
    norm_if(i) = abs(x(i) - x_act(i)) ;
end 
norm_2 = sqrt(norm_2) ;
norm_if = max(norm_if) ;
fprintf("||x - x*||2 = %f\n",norm_2);
fprintf("||x - x*||infinite = %f\n",norm_if);


% function for significant digit 
function value = significant_digit(X, D)
    if X == 0
        value = 0;
    else       
        order = floor(log10(abs(X)));       % Calculate the order of magnitude
        factor = 10^(D - order - 1);        % Calculate the factor for rounding
        value = round(X * factor) / factor; % Perform rounding
    end
end

   