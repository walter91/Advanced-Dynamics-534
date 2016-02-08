function ydot = hw6_1_solve(t, y)

global m L g R

theta = y(1);
thetadot = y(2);

ydot_1 = thetadot;
ydot_2 = (-(thetadot^2)*(R^2)*theta - g*R*theta*cos(theta))/((R^2)*(theta^2) + (L^2)/12);                             

ydot = [ydot_1; ydot_2];

end