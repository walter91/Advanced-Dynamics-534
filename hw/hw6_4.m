clear; clc;

global I1 I2 I3 k1 k2 T

I1 = 1;
I2 = 1;
I3 = 1;

k1 = 2;
k2 = 5;

T = 0;

initCond = [5; 0; 0; 0; 0; 0];

t = 0:.01:100;

[t, state] = ode45('hw6_4_solve', t, initCond);

figure(1); clf;

subplot(3,1,1);
plot(t,state(:,1), t, state(:,4));

subplot(3,1,2);
plot(t,state(:,2), t, state(:,5));

subplot(3,1,3);
plot(t,state(:,3), t, state(:,6));








