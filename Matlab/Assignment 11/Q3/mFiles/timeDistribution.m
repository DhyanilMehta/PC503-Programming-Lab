function t = timeDistribution(freq, N, P)
tStep = 1 / freq;
t = linspace(0, N * tStep, P);
end
