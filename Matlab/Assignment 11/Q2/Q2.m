clear;
kHz = 1000;
F = 100 * kHz;
N = 4;
P = 100;
t = linspace(0,N*(1/F),P); % milliseconds 
data = sin(2*pi*F*t);
plot(t,data);
xlabel("Time(in milliseconds)");
title("Sinusoidal plot with 100 kHz frequency of 4 periods");