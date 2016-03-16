function w = hamming(L)
t = 1:L;
w = 0.54 - 0.46*cos(2*pi*t/(L-1));