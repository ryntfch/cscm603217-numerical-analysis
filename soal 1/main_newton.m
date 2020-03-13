addpath(pwd)
pkg load symbolic
format long

funcs = {"x^3+2*x^2+10*x-20";
    "x^x - 2";
    "10*e^(-x)*sin(2*pi*x) - 2";
    "x^4 - 6*x^3 + 12*x^2 - 10*x + 3";
    "x^2 - cos(pi*x)"
};

diffs = {"3*x^2+4*x+10";
    "x^x*(log(x)+1)";
    "-10*e^(-x)*sin(2*pi*x)-2*pi*cos(2*pi*x)";
    "4*x^3 - 18*x^2 + 24*x - 10";
    "pi*sin(pi*x)+2*x"
};

tols = { 10e-4; 10e-6; 10e-8; 10e-10; 10e-12};

xss = { 
    {0; 2; 4; 3; -1; };
    {1; 2; 3; 4; 5; };
    {2; 20; 21; 5; 1; };
    {0; 1; 2; 3; 4; };
    {0; 1; -1; 5; 4; };
};

fprintf("\n\\documentclass{article}\n\\usepackage[utf8]{inputenc}\n\n\\title{Tugas 2 Anum}\n\\author{author}\n\\date{March 2020}\n\n\\usepackage{natbib}\n\\usepackage{graphicx}\n\n\\usepackage{geometry}\n\\geometry{a4paper, margin=1cm}\n\n\\begin{document}\n\n\\maketitle\n\n\\section{Newton Method Experiment}")

experiment_no = 1;
for i=1:size(funcs)(1)
    xs = xss{i};
    fprintf("\\begin{displaymath}\n%s = 0 \n\\end{displaymath}\n\n\\begin{center}\n", funcs{i})
    for j=1:size(tols)(1)
        for k=1:size(xs)(1)
            func = funcs{i};
            derivate = diffs{i};
            [x, n] = newton(xs{k}, tols{j}, func, derivate);
            if (mod(experiment_no, 3) == 0)
                fprintf("\\begin{tabular}{|c|c|} \n\\hline \n& Value \\\\ \\hline \nGuesses & %.2f \\\\ \nError Tolerance & $%9.2e$ \\\\ \nRoot & %.10g \\\\ \nIteration & %d \\\\ \\hline \n\\end{tabular}\n\n", xs{k}, tols{j}, x, n)
            else
                fprintf("\\begin{tabular}{|c|c|} \n\\hline \n& Value \\\\ \\hline \nGuesses & %.2f \\\\ \nError Tolerance & $%9.2e$ \\\\ \nRoot & %.10g \\\\ \nIteration & %d \\\\ \\hline \n\\end{tabular}", xs{k}, tols{j}, x, n)
            endif
            experiment_no = experiment_no + 1;
        end
    end
    fprintf("\n\\end{center}\n\n")
end
fprintf("\n\\end{document}")