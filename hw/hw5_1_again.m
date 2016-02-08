clear; clc;

syms Rx Ry L m phiddot thetaddot g

theta = 30 * (pi/180);

eqn1 = (-Rx/L)/2 == (3/4)*m*(L^2)*phiddot;

eqn2 = (Ry*sin(theta)*L)/2 + (Rx*cos(theta)*L)/2 == (1/12)*m*(L^2)*thetaddot;

eqn4i = Rx == m*((2*phiddot/L) + cos(theta)*thetaddot*(L/2));

eqn4j = (Ry - m*g) == m*(sin(theta)*thetaddot*(L/2));


Rx = m*((2*phiddot)/L + (3^(1/2)*L*thetaddot)/4)
Ry = g*m + (L*m*thetaddot)/4









