X = cat(1,out.L01_X(2:end),out.L02_X(2:end),out.L03_X(2:end),out.R01_X(2:end),out.R02_X(2:end),out.R03_X(2:end),out.F_X(2:end));
Y = cat(1,out.L01_Y(2:end),out.L02_Y(2:end),out.L03_Y(2:end),out.R01_Y(2:end),out.R02_Y(2:end),out.R03_Y(2:end),out.F_Y(2:end));
robotX = out.Xrobot;
robotY = out.Yrobot;

figure;
plot(X, Y, '.', robotX, robotY, "--");
grid on;

[minX,~] = bounds(X);
[minY,~] = bounds(Y);
if minX < 0
    X = X + abs(minX);
    robotX = robotX + abs(minX);
end
if minY < 0
    Y = Y + abs(minY);
    robotY = robotY + abs(minY);
end
[~,maxX] = bounds(X);
[~,maxY] = bounds(Y);

map = binaryOccupancyMap(maxX,maxY,6);
setOccupancy(map, [X Y], 1)
figure
show(map)