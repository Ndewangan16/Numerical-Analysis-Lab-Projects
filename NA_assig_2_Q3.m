% Name - Nikhil Dewangan 
% Roll no. - 244103008 
% Q3 - Write a code to generate a 10 ×10 random matrix and find out its trace.  
%_______________________________________________________________

clc;
clear all ;
u=10;             % uper limit 
l=-10;            % lower limit  
trac = 0 ;

for i=1:10
    for j=1:10
        A(i,j) = l + (u-l)*rand ;
        if i==j
            trac = trac + A(i,j) ;
        end        
    end   
end
disp("Matrix A is")
disp(A)
disp("trace of Matrix A is ")
disp(trac)