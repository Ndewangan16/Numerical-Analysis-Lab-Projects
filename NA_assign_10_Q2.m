clc;
clear all;

function value = fun(x)
    value = exp(x)*sin(x)/(1+x^2) ;
end 
I_true = 1.9401 ;
fprintf("I_true = %f\n",I_true)
n = [2,3,4];
for k =1:3
    switch n(k)
        case 2
            c = [1.0000000000000000, 1.0000000000000000];
            xd = [-0.5773502691896257, 0.5773502691896257];
        
        case 3
            c = [0.8888888888888888, 0.5555555555555556, 0.5555555555555556];
            xd = [0.0000000000000000, -0.7745966692414834, 0.7745966692414834];
        
        case 4
            c = [0.6521451548625461, 0.6521451548625461, 0.3478548451374538, 0.3478548451374538];
            xd = [-0.3399810435848563, 0.3399810435848563, -0.8611363115940526, 0.8611363115940526];
        
        otherwise
            error('Gauss-Legendre quadrature is only implemented for n = 2, 3, 4.');
    end
    
    a = 0;
    b = 2;
    a_0 = (b+a)/2 ;
    a_1 = (b-a)/2 ; 
    I = 0 ;
    for i=1:n(k)
        I = I + c(i)*fun(a_0 + a_1*xd(i)) ;
    end
    I = I*a_1 ;
    error = 100*(abs(I-I_true)/I_true);
    fprintf("For n = %d\n",n(k))
    fprintf("I_numerical = %.8f\n",I)
    fprintf("Percentage error = %.8f\n",error);
    fprintf("______________________________________\n")
end

