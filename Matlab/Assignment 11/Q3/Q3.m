clear;
%% Variables for plotting
kHz = 1000;
N = 4; % Number of cycles/periods
P = 200; % Samples
freq1 = 100 * kHz; % Frequency in kHz
freq2 = 1 * kHz;

%% Plot A,B,C,D,E,F
t1 = timeDistribution(freq1, N, P);
x1 = sin(2*pi*freq1*t1);

t2 = timeDistribution(freq2, N, P);
x2 = sin(2*pi*freq2*t2);

x3 = square(2*pi*freq2*t2);

tArr = [t1;t2];
xArr = [x1; x2; x3; x1 .* x2; x1 .* x3; x1 .* -x3];

subplotFunc(tArr, xArr, randi([4,6]));
sgtitle("Frequency Subplots");