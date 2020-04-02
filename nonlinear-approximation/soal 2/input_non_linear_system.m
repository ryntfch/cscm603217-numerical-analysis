% total variables to solve
tot_var=2;

% first equation
F1 = @(x) x(1)^2 + 3*x(1)*x(2)^2 + 8*x(2) - 100;

% second iteration
F2 = @(x) cos(pi*x(1))-x(1)*x(2)^2+35;

F = {F1, F2};

x(1) = 20 % x;
x(2) = 19 % y