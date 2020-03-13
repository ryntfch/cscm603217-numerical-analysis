function [x,n] = fixed_point_method(xs, tol, g)
    g = str2func(['@(x)', g]);
    n = 0;
    pre_x = 0;
    x = g(xs);
    while (abs(x-pre_x) > tol & n < 1000)
        pre_x = x;
        x = g(x);
        n = n+1;
    end
endfunction