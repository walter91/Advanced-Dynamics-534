function ydot = hw3_5_solve(t, y)

global m g R k 

omega = 5*sin(t);
omegaDot = 5*cos(t);

s = y(1);
sDot = y(2);

ydot = [sDot; (-k*s/m) + omegaDot*R + s*omega^2];