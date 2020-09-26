clear all;
pi=3.14;
N=8;
n=0:1:N-1;


x=cos(((3*pi)/8)*n)             %Signal
fx=dfs(x,N)
E_t=sum(abs(x.^2))              %Energy in time domain
E_f=sum(abs(fx.^2))/N           %Energy in frequency domain

function [Xk] = dfs(xn,N)
    n = [0:1:N-1];
    k = [0:1:N-1]; 
    WN = exp(-j*2*pi/N); 
    nk = n'*k; 
    WNnk = WN .^ nk; 
    Xk = xn * WNnk;
end
