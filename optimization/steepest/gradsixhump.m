%file name:  grad.m
%This routine evaluates the gradient of the Rosenbrock function

function y = grad(x)
y(1) = 2*(x(1)^5 - 4.2*x(1)^3 + 4*x(1) + 0.5*x(2));
y(2) = x(1) + 16*x(2)^3 - 8*x(2);
y = y';
