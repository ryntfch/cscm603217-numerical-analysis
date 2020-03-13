funcs = {
    "x^3+2*x^2+10*x-20";
    "x^x - 2";
    "10*e^(-x)*sin(2*pi*x) - 2";
    "x^4 - 6*x^3 + 12*x^2 - 10*x + 3";
    "x^2 - cos(pi*x)"
};

tols = { 10e-4; 10e-6; 10e-8; 10e-10; 10e-12};

xss = {
{
    {1; 2};
    {2; 4};
    {-2; -1};
    {-10; 10};
    {-2; 1}
},
{
    {1; 2};
    {-1; 1};
    {2; 3};
    {0; 4};
    {1; 30}
},
{
    {-0.1; 0.1};
    {0; 1};
    {0.2; 0.3};
    {0.4; 0.5};
    {-1; 1}
},
{
    {0; 2};
    {2; 4};
    {1; 2};
    {2; 3};
    {1; 3}
},
{
    {-1; 0};
    {0; 1};
    {-1; 1};
    {-10; 10};
    {-0.1; 0.1}
}
};
 
fprintf("\n\\documentclass{article}\n\\usepackage[utf8]{inputenc}\n\n\\title{Tugas 2 Anum}\n\\author{author}\n\\date{March 2020}\n\n\\usepackage{natbib}\n\\usepackage{graphicx}\n\n\\usepackage{geometry}\n\\geometry{a4paper, margin=1cm}\n\n\\begin{document}\n\n\\maketitle\n\n\\section{Newton Method Experiment}")

experiment_no = 1;
for i=1:size(funcs)(1)
    xs = xss{i};
    fprintf("\\begin{displaymath}\n%s = 0 \n\\end{displaymath}\n\n\\begin{center}\n", funcs{i});
    for j=1:size(tols)(1)
        for k=1:size(xs)(1)
            func = funcs{i};
            [x, n] = bisection_method(func, xs{k}{1}, xs{k}{2}, tols{j});
            if (mod(experiment_no, 3) == 0)
                fprintf("\\begin{tabular}{|c|c|} \n\\hline \n& Value \\\\ \\hline \nGuesses & [%.2f, %.2f] \\\\ \nError Tolerance & $%9.2e$ \\\\ \nRoot & %f \\\\ \\hline \n\\end{tabular}\n\n", xs{k}{1}, xs{k}{2}, tols{j}, x);
            else
                fprintf("\\begin{tabular}{|c|c|} \n\\hline \n& Value \\\\ \\hline \nGuesses & [%.2f, %.2f] \\\\ \nError Tolerance & $%9.2e$ \\\\ \nRoot & %f \\\\ \\hline \n\\end{tabular}", xs{k}{1}, xs{k}{2}, tols{j}, x);
            endif
            experiment_no = experiment_no + 1;
        end
    end
    fprintf("\n\\end{center}\n\n");
end
fprintf("\n\\end{document}");