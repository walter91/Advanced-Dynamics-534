clear; clc;

global omega m mu g

omega = 10;
m = 1;
mu = .5;
g = 9.81;

do = .05;
ddoto = 0;

init = [do ddoto];

t = 0:.001:.71;

[t, y] = ode45('hw3_3_solve', t, init);

figure(1); clf;
subplot(2,1,1);
plot(t, y(:,1));
xlabel('Time (sec)');
ylabel('Position (m)');
grid on

subplot(2,1,2);
plot(t,y(:,2));
xlabel('Time (sec)')
ylabel('Velocity (m/sec)')
grid on