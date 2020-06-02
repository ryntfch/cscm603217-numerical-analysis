% Program ini hanya membaca input koordinat yang diklik
% n adalah jumlah titik yang displine

function pathcalculator(n)
  plot([-1 1],[0,0],'k',[0 0],[-1 1],'k');hold on
  t=0:.02:1;
  xdata = zeros(1,n);
  ydata = zeros(1,n);
  for i=1:n
    [x,y,b] = ginput(1) 
    plot(x,y,'bo');
    xdata(i) = x;
    ydata(i) = y;    
  endfor

endfunction
