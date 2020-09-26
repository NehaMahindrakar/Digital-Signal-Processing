clear all;
pi=3.14;
choice=input('1.DFT 2.IDFT \n Enter your choice-')
switch(choice)
    case 1
        xn=input('Enter the sequence-'); 
        N =length(xn);
        Xk = dfs(xn,N)
        Yk=idfs(Xk,N)


        subplot(2,3,1)
        stem(abs(xn),'filled')
        title('Given Signal')
        xlabel('Time --->')
        ylabel('Magnitude')
        subplot(2,3,4)
        stem(angle(xn),'filled')
        title('Given Signal')
        xlabel('Time --->')
        ylabel('Phase')


        subplot(2,3,2)
        stem(abs(Xk),'filled')
        title('N(08) point DFT')
        xlabel('Time --->')
        ylabel('Magnitude')
        subplot(2,3,5)
        Xk=round(Xk,1)
        stem(angle(Xk)*(180/pi),'filled')
        title('N(08) point DFT')
        xlabel('Time --->')
        ylabel('Phase')


        subplot(2,3,3)
        stem(abs(Yk),'filled')
        title('N(08) point IDFT')
        xlabel('Time --->')
        ylabel('Magnitude')
        subplot(2,3,6)
        Yk=round(Yk,1)
        stem(angle(Yk),'filled')
        title('N(08) point IDFT')
        xlabel('Time --->')
        ylabel('Phase')
     
    case 2
        xn=input('Enter the sequence-'); 
        N =length(xn);
        Yk =idfs(xn,N)
        Xk=dfs(Yk,N)


        subplot(2,3,1)
        stem(abs(xn),'filled')
        title('Given Signal')
        xlabel('Time --->')
        ylabel('Magnitude')
        subplot(2,3,4)
        stem(angle(xn),'filled')
        title('Given Signal')
        xlabel('Time --->')
        ylabel('Phase')

        subplot(2,3,2)
        stem(abs(Yk),'filled')
        title('N(08) point IDFT')
        xlabel('Time --->')
        ylabel('Magnitude')
        subplot(2,3,5)
        Yk=round(Yk,1)
        stem((angle(Yk)*180)/pi,'filled')
        title('N(08) point IDFT')
        xlabel('Time --->')
        ylabel('Phase')
        
        
        subplot(2,3,3)
        stem(abs(Xk),'filled')
        title('N(08) point DFT')
        xlabel('Time --->')
        ylabel('Magnitude')
        subplot(2,3,6)
        Xk=round(Xk,1)
        stem((angle(Xk)*180)/pi,'filled')
        title('N(08) point DFT')
        xlabel('Time --->')
        ylabel('Phase')
end        
     

function [Xk] = dfs(xn,N)
    n = [0:1:N-1];
    k = [0:1:N-1]; 
    WN = exp(-j*2*pi/N); 
    nk = n'*k; 
    WNnk = WN .^ nk; 
    Xk = xn * WNnk;
end

function [xn] = idfs(Xk,N)
    n = [0:1:N-1]; 
    k = [0:1:N-1]; 
    WN = exp(-j*2*pi/N)
    nk = n'*k; 
    WNnk = WN .^ (-nk); 
    xn = (Xk * WNnk)/N;
end
