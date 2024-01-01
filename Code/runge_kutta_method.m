clear all

% Runge Kutta Method for solving a differential equation
% dy/dx = x^3 - y
% Interval: [0,3]
% Initial condition: y(0) = 1
% Step size: h = 0.1


% Define the differential equation function
f = @(x,y) x^3 - y;

% Interval 
a = 0;  % Start point of the interval
b = 3;  % End point of the interval

% Initial Values for the Runge Kutta Method 
x(1) = 0; 
y_RungeKutta(1) = 1; 

% Step Size 
h = 0.1; 

% Calculate the number of iterations needed
n = (b - a)/h;

% Iterate from 2 to n+1 to calculate values for x and y
for i = 2 : n+1
    % Increment x by h
	x(i) = x(i-1) + h

    k1 = f(x(i-1), y_RungeKutta(i-1));
    k2 = f(x(i-1) + h/2, y_RungeKutta(i-1) + k1/2);
    k3 = f(x(i-1) + h/2, y_RungeKutta(i-1) + k2/2);
    k4 = f(x(i-1) + h, y_RungeKutta(i-1) + k3);

    % Runge Kutta's formula
	y_RungeKutta(i) = y_RungeKutta(i-1) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end

plot(x,y_RungeKutta, '-o')
xlabel('X-axis')
ylabel('Y-axis')
title("Approximation of y' = x^3 - y using Runge Kutta Method")
grid on 
legend('Runge Kutta Method')