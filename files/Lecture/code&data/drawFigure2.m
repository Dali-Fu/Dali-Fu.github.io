x = 0 : 200;
c = simulationPath (0.38 , 0.72 , 200);
y = simulationPath (0.77 , 1, 200);
n = simulationPath (0.27 , 0.2 , 200);
i = simulationPath (0.58 , 0.29 , 200);
plot (x, c, 'r+-', x, y, 'bd -', x, n, 'g^-', x,i, 'm^-', 'Markersize', 3);
title ('Figure  2:  Transition   dynamics ,  levels ');
ylabel ('Levels ');
xlabel ('Quarters ');
legend ('c', 'y', 'n', 'i');