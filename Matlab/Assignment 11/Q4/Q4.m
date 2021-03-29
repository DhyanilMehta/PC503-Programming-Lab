clear;
cols03 = extractColsTHz(fullfile("Q4", "0.3THz.txt"));
disp(cols03)

xAxis = cols03(2,:);

yAxis = cols03(4,:);

plot(xAxis, yAxis, "Marker","pentagram")

hold on
yAxis = cols03(5,:);
plot(xAxis, yAxis, "Color",[0 0.9 0.8], "Marker", "hexagram")

hold on
yAxis = cols03(6,:);
plot(xAxis, yAxis, "Color",[0 1 0],"Marker","*")

hold on
yAxis = cols03(7,:);
plot(xAxis, yAxis, "Color",[0.5 0.3 0.1],"Marker","+")


hold on
yAxis = cols03(8,:);
plot(xAxis, yAxis, "Color",[0.2 0.2 0.2],"Marker","square")


hold on
yAxis = cols03(9,:);
plot(xAxis, yAxis, "Color",[1 0 0],"Marker","o")

xlabel("y [um]");
legend("HxRe [A/m]", "HyRe [A/m]", "HzRe [A/m]", "HxIm [A/m]", "HyIm [A/m]", "HzIm [A/m]")
