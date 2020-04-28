function [v,g] = paraboloid(x)
  
  A = [1 10 3 5 7 9 1 1 2 3 5 8 13 21]; % coefs
  B = [0 5 3 8 11 19 30 49 79 128 3 5 7 9];  % center
  v = sum(A.*((x-B).^2));
  g = 2*A.*(x-B)
endfunction

addpath(pwd)
fun = @paraboloid;
% Call L-BFGS starting from the origin
[x,fval,exitflag,output] = lbfgs(fun, zeros(1,14));
