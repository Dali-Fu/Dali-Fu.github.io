x = 0 : 200;
k = simulationPath (-1, 0, 200);
c = simulationPath ( -0.63 , 0, 200);
y = simulationPath ( -0.25 , 0, 200);
n = simulationPath (0.3 , 0, 200);
i = simulationPath (0.72 , 0, 200);
plot (x, k, 'ks -', x, c, 'r+-', x, y, 'bd -', x, n, 'g^-', x, i, 'm^-', 'Markersize', 3);
title ('Figure  1:  Transition   dynamics , percentage   deviations ');
ylabel ('Percent   Deviations ');
xlabel ('Quarters ');
box off;
legend ('k', 'c', 'y', 'n', 'i');