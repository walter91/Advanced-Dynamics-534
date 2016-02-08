clear; clc;

global m1 m2 R k g gamma f

m1 = 5;
m2 = 5;
k = 2;
g = 9.81;
gamma = 20 * (pi/180);
f = 1 ;


tf = 100;

t = 0:.01:tf;

x10 = 0;
x20 = 5;
x1dot0 = 0;
x2dot0 = 0;

initCond = [x10; x20; x1dot0; x2dot0];

[t, soln] = ode45('hw6_2_solve', t, initCond);

figure(1); clf;
plot(t, soln(:,1), t, soln(:,2), t, soln(:,3), t, soln(:,4))
legend('x1', 'x1-dot', 'x2', 'x2-dot');



