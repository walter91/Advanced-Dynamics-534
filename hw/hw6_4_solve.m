function ydot = hw6_4_solve(t,y)

global I1 I2 I3 k1 k2 T

theta = y(1);
phi = y(2);
beta = y(3);
thetaDot = y(4);
phiDot = y(5);
betaDot = y(6);

M = [I1, 0, 0;...
     0, I2, 0;...
     0, 0, I3];

F = [T - k1*(theta - phi);...
     -k1*(phi - theta) - k2*(phi - beta);...
     -k2*(beta - phi)];

ydot = [[zeros(length(y)/2) eye(length(y)/2)]*y;...
        M\F];



