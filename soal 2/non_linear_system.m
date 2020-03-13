% maximal iteration
% max_itr=1000;

% tolerance
% tol=10^-5;

% total variables to solve
% tot_var=2;

% first equation
% F(1) = @(x) x(1)^2 + 3*x(1)*x(2)^2 + 8*x(2) - 100;

% second iteration
% F(2) = @(x) cos(pi*x(1))-x(1)*x(2)^2+35;

% display("-----------------")
% x(1) =  9 % x
% x(2) = -1 % y
% display("-----------------")

input_non_linear_system;

loop  = 0;
maxdx = 1;

while (loop < max_itr) && (maxdx > tol)

    deriv_func = zeros(tot_var,tot_var);

    for i = 1:tot_var
        for j = 1:tot_var
            func = F{i};
            xj = x;

            xj(j) = x(j) + (tol/2);
            y1 = func(xj);

            xj(j) = x(j) - (tol/2);
            y0 = func(xj);

            deriv_func(i,j) = (y1-y0) / tol;
        end
    end
           
    for i = 1:tot_var
       j = F{i};
       D(i,1) = j(x);
    end
    
    A = inv(deriv_func);
    error = A*D;
    dx = error';

    temp = x;
    display("-------------------------");
    display(loop+1);
    x = x - dx
    maxdx = abs(x - temp);
    
    loop = loop + 1;  
    
end

display("------- result -------")
x
loop

