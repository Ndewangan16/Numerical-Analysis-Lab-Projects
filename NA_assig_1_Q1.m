% Name - Nikhil Dewangan
% Roll = 244103008
%________________________________________________

%Q1 Find the machine precession
clc
a = 1 ;
n = 1 ;
while n<100
    b = 10^-n + a ;
    if a==b
        break
    end
    n=n+1;
end

n=10^-(n-1) ;
fprintf("machine precession is");
disp(n);
fprintf("%.20f\n",n);
