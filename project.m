clear; clc;

syms theta phi thetadot phidot real
syms d1 d2 h2 real
syms I1 I2 real
syms m2 real

w2 = [thetadot; 0; phidot];

r1 = [d1; 0; 0];
r1_dot = [0; d1*phidot; 0];

T1 = (1/2)*I1*(phidot)^2;
V1 = 0;

V2 = -h2*cos(theta);

r2 = [d2; h2*sin(theta); -h2*cos(theta)];
r2_dot = [-h2*phidot*sin(theta); h2*thetadot*cos(theta)+d2*phidot; thetadot*sin(theta)];

r2_r2 = dot(r2_dot, r2_dot)

T2 = (1/2)*m2*(r2_r2) + w2'*I2*w2

L = T1 + T2 - V1 - V2






