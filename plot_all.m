clear; clc; close all;

data = load('30degL.dat');
t = data(:,1);
theta = 180*data(:,2)/pi;
phi = 180*data(:,3)/pi;
clear data;

figure(1); clf;
plot(t, phi, t, theta);
legend('phi', 'theta');
grid on

data = load('45degL.dat');
t = data(:,1);
theta = 180*data(:,2)/pi;
phi = 180*data(:,3)/pi;
clear data;

figure(2); clf;
plot(t, phi, t, theta);
legend('phi', 'theta');
grid on
