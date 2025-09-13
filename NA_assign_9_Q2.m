clc;
clear all ;

u = 1.8*10^-5 ;
A = load("NA_assign_9_input_Q2.txt") ;
y = A(1,:) ;
v = A(2,:) ;

u = 1.8*10^-5  ; % Dynamic coefficient  in Ns/m^2
Y = 0 ;
i = 2 ;
a = v(i-1)*( 2*Y - y(i) - y(i+1) )/( (y(i-1) - y(i))*(y(i-1) - y(i+1)) ) ;
b = v(i)*( 2*Y - y(i-1) - y(i+1) )/( (y(i) - y(i-1))*(y(i) - y(i+1)) ) ;
c = v(i+1)*( 2*Y - y(i-1) - y(i) )/( (y(i+1) - y(i))*(y(i+1) - y(i-1)) ) ; 
df = a+b+c ;

shear = u*df ;    

fprintf("Shear stress at the sueface = %0.8f N/m^2\n",shear)