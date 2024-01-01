clear all

% Euler method for solving a differential equation
% dy/dx = exp( -2*x )
% Interval: [0,2]
% Initial condition: y(0) = -0.5
% Step size: h = 0.2

% Define the differential equation function
f = @(x, y) exp(-2*x);

% Define the exact function 
f_exact = @(x) -0.5 * exp( -2 * x )
 
% Interval 
a = 0;  % Start point of the interval
b = 2;  % End point of the interval

% Initial Values for the Euler Method 
x(1) = 0; 
y_euler(1) = -0.5; 

% Step Size 
h = 0.2;

% Initial Values for the exact function to calculate the error    
y_real(1) = -0.5; 
error(1) = 0;

% Calculate the number of iterations needed
n = (b - a)/h;

% Iterate from 2 to n+1 to calculate values for x and y
for i = 2 : n+1

    % Increment x by h
	x(i) = x(i-1) + h

    % Euler's formula
	y_euler(i) = y_euler(i-1) + h * ( f(x(i-1),y_euler(i-1)) ) 
    
    % Calculate the exact value of y 
	y_real(i) = f_exact( x(i) )

    % Calculate the relative error
    error(i) = abs( y_real(i) - y_euler(i) ) / abs( y_real(i) ) ;
end

figure
hold on
plot(x, y_euler, 'b-o')  
plot(x, y_real, 'r-*')   
hold off
 
xlabel('X-axis')
ylabel('Y-axis')
title("Approximation of y' = exp(-2 * x) using Euler Method")
legend('Euler Method', 'Exact Function')
grid on