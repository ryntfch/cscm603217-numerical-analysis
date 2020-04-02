function [x, n] = newton(x0, Tol, f, d)
    format long

    % preparation of the function
    fx = str2func(['@(x)', f]);
    dfx = str2func(['@(x)', d]);

    n = 0;
    # function
    f0 = fx(x0);

    while abs(f0) > Tol
        # first derivatife of the function
        df0 = dfx(x0);
        if(df0 != 0)
            x0 = x0 - (f0/df0);
        else
            x = -1;
            n = -1;
            break;
        endif
        f0 = fx(x0);
        n = n+1;
    endwhile
    n;
    x = x0;
endfunction