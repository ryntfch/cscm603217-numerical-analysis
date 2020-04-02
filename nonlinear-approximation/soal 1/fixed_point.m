funcs = {
    "x^3+2*x^2+10*x-20";
    "x^x - 2";
    "10*e^(-x)*sin(2*pi*x) - 2";
    "x^4 - 6*x^3 + 12*x^2 - 10*x + 3";
    "x^2 - cos(pi*x)";
};

tols = { 10e-4; 10e-6; 10e-8; 10e-10; 10e-12};

fp_func_1 = {
    %1.3688
    "(20-x^3-2*x^2)/10"; %not, 1.10960
    "(20-10*x) / (x^2+2*x)"; %not, 3.57498
    "20 / (x^2+2*x+10)"; %yes, 0.44383
};

fp_func_2 = {
    %1.55961
    "log(x,2)"; %no, -2.25005
    "2^(1/x)"; %yes, 0.44444
    "-ln(2/(10*sin(2*pi*x)))"; %
};

fp_func_3 = {
    %0.03314
    "asin(2/(10*exp(-x))) / (2*pi)"; %yes, 0.03363
    "-ln(2/(10*sin(2*pi*x)))"; %no, 29.7376

};

fp_func_4 = {
    %1 or 3
    "-3 / (x^3-6*x^2+12*x-10)"; %no, 1 or 9
    "(10*x-3) / (x^3-6*x^2+12*x)"; %yes, 1 -> 1 or 3 -> 0.11111
    "(x^4+3) / (6*x^2-12*x+10)"; %no, 1 -> 1 or 3 -> 1.28571
};

fp_func_5 = {
    %0.438431 or -0.438431
    "sqrt(cos(pi*x))"; %no, 3.51596
    "cos(pi*x) / x"; %no, 6.0319
    "arccos(x^2) / pi"; %yes, 0.27390
};

funcs = {
    "20 / (x^2+2*x+10)";
    "2^(1/x)";
    "asin(2/(10*exp(-x))) / (2*pi)";
    "(10*x-3) / (x^3-6*x^2+12*x)";
    "acos(x^2) / pi";
};

xss = {
    {-2, -1, 0, 1, 2},
    {-2, -1, 0, 1, 2},
    {-2, -1, 0, 1, 2},
    {-2, -1, 0, 1, 2},
    {-2, -1, 0, 1, 2}
};

fprintf("\n\\documentclass{article}\n\\usepackage[utf8]{inputenc}\n\n\\title{Tugas 2 Anum}\n\\author{author}\n\\date{March 2020}\n\n\\usepackage{natbib}\n\\usepackage{graphicx}\n\n\\usepackage{geometry}\n\\geometry{a4paper, margin=1cm}\n\n\\begin{document}\n\n\\maketitle\n\n\\section{Newton Method Experiment}")

experiment_no = 1;
for i=1:size(funcs)(1)
    xs = xss{i};
    fprintf("\\begin{displaymath}\n%s = 0 \n\\end{displaymath}\n\n\\begin{center}\n", funcs{i})
    for j=1:size(tols)(1)
        for k=1:size(xs)(1)
            func = funcs{i};
            [x, n] = fixed_point_method(xs{k}, tols{j}, func);
            if (mod(experiment_no, 3) == 0)
                fprintf("\\begin{tabular}{|c|c|} \n\\hline \n& Value \\\\ \\hline \nGuesses & %.2f \\\\ \nError Tolerance & $%9.2e$ \\\\ \nRoot & %f \\\\ \nIteration & %d \\\\ \\hline \n\\end{tabular}\n\n", xs{k}, tols{j}, x, n)
            else
                fprintf("\\begin{tabular}{|c|c|} \n\\hline \n& Value \\\\ \\hline \nGuesses & %.2f \\\\ \nError Tolerance & $%9.2e$ \\\\ \nRoot & %f \\\\ \nIteration & %d \\\\ \\hline \n\\end{tabular}", xs{k}, tols{j}, x, n)
            endif
            experiment_no = experiment_no + 1;
        end
    end
    fprintf("\n\\end{center}\n\n")
end
fprintf("\n\\end{document}")