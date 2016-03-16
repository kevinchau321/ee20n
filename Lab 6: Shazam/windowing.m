close all

%% Part 1: Signal creation
% Put your time and signal vectors here
dt = 0.1;
t = [0:dt:2*pi];
t2 = [0:dt:5.5];
xhat= sin(t2);
x=sin(t);


%% Part 2: Time-domain plots
figure(1)
hold on 
% plot stuff here
plot(t,x);
plot(t2,xhat,'r');

legend('X','Xhat','Windowed Xhat')
% uncomment the line above this when you're done

%% Part 3: find DFT of signals

% first find the DFT of x, xhat, and xhatw
X = fft(x);
Xhat = fft(xhat);


window = hamming(56);
windowed_Xhat = xhat.*window;
Windowed_Xhat = fft(windowed_Xhat)

%% Part 4: frequency domain plots
figure(2)
hold on
mag= abs(X);
w = t;
plot(w, mag)

w2= [0:2*pi/55:2*pi];
plot(w2, abs(Xhat), 'r')


plot(w2, abs(Windowed_Xhat), 'g');

legend('X','Xhat','Windowed Xhat')
% uncomment the line above this when you're done
