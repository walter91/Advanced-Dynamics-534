clear; clc;

syms Rx Ry L m phiddot thetaddot g

theta = 30 * (pi/180);

eqn1 = (-Rx/L)/2 == (3/4)*m*(L^2)*phiddot;

eqn2 = (Ry*sin(theta)*L)/2 + (Rx*cos(theta)*L)/2 == (1/12)*m*(L^2)*thetaddot;

eqn4i = Rx == m*((2*phiddot/L) + cos(theta)*thetaddot*(L/2));

eqn4j = (Ry - m*g) == m*(sin(theta)*thetaddot*(L/2));

% solve([eqn1, eqn2, eqn4i, eqn4j],[phiddot, Rx, Ry, thetaddot])





Rx = solve(eqn4i, Rx);
Ry = solve(eqn4j, Ry);

%   Copy from output

Rx = m*((2*phiddot)/L + (3^(1/2)*L*thetaddot)/4)
Ry = g*m + (L*m*thetaddot)/4

% eqn1 = (-(m*((2*phiddot)/L + (3^(1/2)*L*phiddot)/4))/L)/2 == (3/4)*m*(L^2)*phiddot;

%thetaddot = solve(eqn2, thetaddot)


thetaddot = (3*(g*m + (L*m*thetaddot)/4) + 3*3^(1/2)*(m*((2*phiddot)/L + (3^(1/2)*L*thetaddot)/4)))/(L*m)

%thetaddot = (3*Ry + 3*3^(1/2)*Rx)/(L*m)

%eqn = thetaddot ==(3*g*m + 3*3^(1/2)*m*((2*phiddot)/L + (3^(1/2)*L*thetaddot)/4) + (3*L*m*thetaddot)/4)/(L*m)

%thetaddot = solve(eqn, thetaddot)





