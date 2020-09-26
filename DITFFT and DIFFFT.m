clear all;
pi=3.14
x=[1 2 3 4 5 6 7 8]

x1=dif(x)
y1=dit(x)
k=1:1:8

subplot(2,2,1)
stem(k,abs(x1))
title('DIFFFT')
xlabel('N')
ylabel('Magnitude')
subplot(2,2,3)
x1=round(x1,1)
stem(k,angle(x1)*(180/pi))
title('DIFFFT')
xlabel('N')
ylabel('Phase')

subplot(2,2,2)
stem(k,abs(y1))
title('DITFFT')
xlabel('N')
ylabel('Magnitude')
subplot(2,2,4)
y1=round(y1,1)
stem(k,angle(y1)*(180/pi))
title('DITFFT')
xlabel('N')
ylabel('Phase')

function [ y ] = dif( x )                                           
p=nextpow2(length(x));                                                      
x=[x zeros(1,(2^p)-length(x))];                                             
N=length(x);                                                              
S=log2(N);                                                                  
Half=N/2;                                                                   
for stage=1:S;                                                              
    for index=0:(N/(2^(stage-1))):(N-1);                                   
        for n=0:(Half-1);                                                   
            pos=n+index+1;                                                  
            pow=(2^(stage-1))*n;                                           
            w=exp((-1i)*(2*pi)*pow/N);                                      
            a=x(pos)+x(pos+Half);                                           
            b=(x(pos)-x(pos+Half)).*w;                                     
            x(pos)=a;                                                       
            x(pos+Half)=b;                                                 
        end;
    end;
Half=Half/2;                                                                
end
y=bitrevorder(x);                                                           
end

function [ y ] = dit( x )                                            
p=nextpow2(length(x));                                                      
x=[x zeros(1,(2^p)-length(x))];                                             
N=length(x);                                                                
S=log2(N);                                                                 
Half=1;                                                                     
x=bitrevorder(x);                                                           
for stage=1:S;                                                              
    for index=0:(2^stage):(N-1);                                           
        for n=0:(Half-1);                                                   
            pos=n+index+1;                                                  
            pow=(2^(S-stage))*n;                                            
            w=exp((-1i)*(2*pi)*pow/N);                                      
            a=x(pos)+x(pos+Half).*w;                                        
            b=x(pos)-x(pos+Half).*w;                                       
            x(pos)=a;                                                       
            x(pos+Half)=b;                                                  
        end;
    end;
Half=2*Half;                                                                
end;
y=x;                                                                        
end