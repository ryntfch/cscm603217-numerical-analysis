% maximal iteration
max_itr=1000;

% tolerance
tol=10^-5;

% total variables to solve
tot_var=2;

% first equation
F(1) = @(x) x(1)^2 + 3*x(1)*x(2)^2 + 8*x(2) - 100;

% second iteration
F(2) = @(x) cos(pi*x(1))-x(1)*x(2)^2+35;

x(1) =  9 % x
x(2) = -1 % y