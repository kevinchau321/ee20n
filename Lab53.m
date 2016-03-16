%%
w=[-pi:.00005:pi]; 
Hw=1./(1-.9*exp(58*i*w));
%%
t=[0:1/26500:.5]; 
Hw2=1./(1-.99*exp(-58*i*t)); 

DT=zeros(1,13250); DT(1)=1;
y=zeros(1,13251); 
N=100;

for i = 1:N 
    y(i) = DT(i); 
end

for i=N+1:13250 
    y(i) = 0.99*y(i-N) + DT(i); 
end
figure(1)
plot(t,abs(y));

sound(y,26500);

%%
DT=zeros(1,13250); DT(1)=1;
y1=zeros(1,13251); 
N=58;

for i = 1:N 
    y1(i) = DT(i); 
end

for i=N+1:13250 
    y1(i) = 0.99*y1(i-N) + DT(i); 
end

figure(2)
plot(t,abs(y1));

sound(y1,26500);
%%
N=58
p=zeros(1,13250);

for i = 1:N
    p(i)=2*rand()-1;
end


for i = 1:N 
    y2(i) = p(i); 
end

for i=N+1:13250
    y2(i) = 0.99*y2(i-N) + p(i); 
end
figure(1)
plot(y2);
sound(y2,26500);

%%
N=58
p=zeros(1,13250);

for i = 1:N
    p(i)=2*rand()-1;
end


for i = 1:N 
    y3(i) = p(i); 
end

y3(N+1)= 0.99*lpf(y3(1),0) + p(N+1);

for i=N+2:13250
    y3(i) = 0.99*lpf(y3(i-N),y3(i-N-1)) + p(i); 
end

figure(1)
plot(y3);
sound(y3, 26500);


%%
N=200;
p=zeros(1,13250);

for i = 1:N
    p(i)=2*rand()-1;
end


for i = 1:N
    y4(i)=p(i);
end

for i = N+1
    int=2*rand();
    if int > 1
        y4(i)=p(i)+0.99*lpf(y4(i-N),0);
    else
        y4(i)=p(i)-0.99*lpf(y4(i-N),0);
    end
end

for i = N+2:13250
    int=2*rand();
    if int > 1
        y4(i)=p(i)+0.99*lpf(y4(i-N),y4(i-N-1));
    else
        y4(i)=p(i)-0.99*lpf(y4(i-N),y4(i-N-1));
    end
end

figure(1)
plot(y4);
sound(y4, 26500);
