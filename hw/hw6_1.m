clear; clc;

global m L g R

m = 2.1;
L = 1;
g = 9.81;
R = .5;

theta0 = 18*(pi/180);
thetadot0 = 0;

tf = 2;

initCond = [theta0; thetadot0]
t = 0:.001:tf;

[t, soln] = ode45('hw6_1_solve', t, initCond);

figure(1); clf;
subplot(2,1,1);
plot(t, soln(:,1))
title('Position');
xlabel('time (sec)');
ylabel('theta (rad)');

subplot(2,1,2);
plot(t, soln(:,2),'r')
title('Velocity');
xlabel('time (sec)');
ylabel('theta-dot (rad/sec)');