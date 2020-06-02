addpath(pwd)

%x = [0 1];
%y = [2 0];
%xx = linspace(0,6,121);
%plot(xx,csapi(x,y,xx),'k-',x,y,'ro')
%title('Interpolant to Two Points')

x = [0 1 2.5 3.6 5 7 8.1 10];
y = sin(x);
xx = 0:.25:10;
yy = spline(x,y,xx);
plot(x,y,'o',xx,yy)

pause
