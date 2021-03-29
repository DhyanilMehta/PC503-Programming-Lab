function plotGraphIn2by3(timeDist, xFunc, pos)
subplot(2,3,pos), plot(timeDist,xFunc);
xlabel("Time(in ms)");
end
