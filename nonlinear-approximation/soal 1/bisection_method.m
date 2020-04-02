function [x,n] = bisection_method(f,a,b,tol)

% provide the equation you want to solve with R.H.S = 0 form. 
% Write the L.H.S by using inline function
% Give initial guesses.
% Solves it by method of bisection.
% A very simple code. But may come handy

f = str2func(['@(x)', f]);
n=0;

if f(a)*f(b)>0 
    x = NaN;
else
    p = (a + b)/2;
    err = abs(f(p));
    while (err > tol & n < 1000)
      n = n+1;
      if f(a)*f(p)<0 
        b = p;
      else
        a = p;          
      end
      p = (a + b)/2; 
      err = abs(f(p));
    end
    x = p;
end
    
    