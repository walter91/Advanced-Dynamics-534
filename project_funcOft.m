clear; clc;

syms t real
syms theta(t) phi(t) thetadot(t) phidot(t) real
syms d1 d2 h2 real
syms I1 I2 real
syms m2 real



w2 = [thetadot(t); 0; phidot(t)];

r1 = [d1; 0; 0];
r1_dot = [0; d1*phidot(t); 0];

T1 = (1/2)*I1*(phidot(t))^2;
V1 = 0;

V2 = -h2*cos(theta(t));

r2 = [d2; h2*sin(theta(t)); -h2*cos(theta(t))];
r2_dot = [-h2*phidot(t)*sin(theta(t)); h2*thetadot(t)*cos(theta(t))+d2*phidot(t); thetadot(t)*sin(theta(t))];

r2_r2 = dot(r2_dot, r2_dot);

T2 = (1/2)*m2*(r2_r2) + w2'*I2*w2;

L = T1 + T2 - V1 - V2






