% Name - Nikhil Dewangan
% Roll = 244103008
%________________________________________________

% Q3 Develop a Class of complex number
clc;
clear all;
disp("Give two complex number A+iB and C+iD ")
A = input('real number of complex number 1 A = ') ;
B = input('imaginary number of complex number 1 B = ') ;
C = input('real number of complex number 2 C = ') ;
D = input('imaginary number of complex number 2 D = ') ;
% Create two complex numbers
c1 = ComplexNumber(A, B);
c2 = ComplexNumber(C, D );

disp('Complex Number 1:');
disp(c1);

disp('Complex Number 2:');
disp(c2);

% Addition
result_add = c1.add(c2);
disp('Addition:');
disp(result_add);

% Subtraction
result_sub = c1.subtract(c2);
disp('Subtraction:');
disp(result_sub);

% Multiplication
result_mul = c1.multiply(c2);
disp('Multiplication:');
disp(result_mul);

% Conjugate
disp('Conjugate of Complex Number 1:');
result_conj_c1 = c1.conjugate();
disp(result_conj_c1);

disp('Conjugate of Complex Number 2:');
result_conj_c2 = c2.conjugate();
disp(result_conj_c2);
