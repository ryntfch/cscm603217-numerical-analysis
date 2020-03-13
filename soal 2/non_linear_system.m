% import function and initial value
input_non_linear_system;

% maximal iteration
max_itr=1000;

% tolerance
tol=10^-5;

loop  = 0;
x_diff = 1;

while (loop < max_itr) && (x_diff > tol)

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
    loop = loop + 1;  
    display("-------------------------");
    display(loop);
    x = x - dx
    x_diff = abs(x - temp);
    
   
    
end

display("------- result -------")
x
loop

