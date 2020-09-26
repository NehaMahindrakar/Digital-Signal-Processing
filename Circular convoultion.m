clear all;
pi=3.14
x1 = [1,2,2,2,2,2,2,1] 
x2 = [1,2,3,4,5,6,7,8]
N=8;
y = circonvt(x1, x2, N)
y=dfs(y,N)

Yk1=dfs(x1,N)
Yk2=dfs(x2,N)

y1=Yk1.* Yk2


subplot(2,2,1)
stem(abs(y),'filled')
title('Circular convolution-LHS')
xlabel('Time')
ylabel('Magnitude')
subplot(2,2,3)
y=round(y,10)
stem(angle(y)*(180/pi),'filled')
title('Circular convolution-LHS')
xlabel('Time')
ylabel('Phase')

subplot(2,2,2)
stem(abs(y1),'filled')
title('Circular convolution-RHS')
xlabel('Time')
ylabel('Magnitude')
subplot(2,2,4)
y1=round(y1,1)
stem((angle(y1)*(180/pi)),'filled')
title('Circular convolution-RHS')
xlabel('Time')
ylabel('Phase')




function y = circonvt(x1,x2,N)
    if length(x1) > N
        error('N must be >= the length of x1')
    end

    if length(x2) > N
        error('N must be >= the length of x2')
    end
    
x1=[x1 zeros(1,N-length(x1))];
x2=[x2 zeros(1,N-length(x2))];
m = [0:1:N-1];
x2 = x2(mod(-m,N)+1);
H = zeros(N,N);
for n = 1:1:N
    H(n,:) = cirshftt(x2,n-1,N);
end
y = x1*conj(H');
end

function y = cirshftt(x,m,N)
if length(x) > N
    error('N must be >= the length of x')
end
x = [x zeros(1,N-length(x))];
n = [0:1:N-1];
n = mod(n-m,N);
y = x(n+1);
end

function [Xk] = dfs(xn,N)
    n = [0:1:N-1];
    k = [0:1:N-1]; 
    WN = exp(-j*2*pi/N); 
    nk = n'*k; 
    WNnk = WN .^ nk; 
    Xk = xn * WNnk;
end


