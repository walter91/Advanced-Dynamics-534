% This m-file is similar to the file that will be used in the final project
% competition.  It (1) loads the experimental response data, (2) plots the
% initial data, (3) allows the user to select the start time, (4) adjusts
% the data based on the selected start time, (5) finds the initial
% conditions from the parsed experimental data, (6) calls the user's
% function to get the simulated response, and (7) plots the simulated
% response on the same plot as the measured response.  The only things that
% students should change are (1) the name of the experimental data file
% (if desired), and (2) the name of the function that is called.

clear;
clc;
close all;

% Load data.  Note that LabVIEW stores angles in radians, so we need to
% convert to degrees for plotting purposes.  ** CHANGE THIS TO LOAD
% WHICHEVER DATA FILE YOU WANT TO USE. THE FIRST COLUMN SHOULD BE TIME IN
% SECONDS, THE SECOND COLUMN SHOULD BE THETA IN RADIANS, AND THE THIRD
% COLUMN SHOULD BE PHI IN RADIANS. **
data = load('30degL.dat');
t = data(:,1);
theta = 180*data(:,2)/pi;
phi = 180*data(:,3)/pi;
clear data;
N = length(t);

% Determine sample rate and Nyquist frequency.
dt = mean(diff(t));
fs = 1/dt;
fn = fs/2;

% Plot initial data.
figure(1);
plot(t,phi,'k',t,theta,'r');
xlabel('t (s)');
ylabel('Angle (deg)');
legend('\phi (measured)','\theta (measured)');

% Select response start time by clicking on the plot.
disp('Select response start time by clicking on the plot...');
T = ginput(1);
tstart = T(1,1);
Istart = find(t <= tstart);
istart = max(Istart);

% Parse data set.
t = t(istart:N)-t(istart);
theta = theta(istart:N);
phi = phi(istart:N);
N = length(t);

% Plot parsed data.
figure(1);
plot(t,phi,'k',t,theta,'r');
xlabel('t (s)');
ylabel('Angle (deg)');
legend('\phi (measured)','\theta (measured)');

% Filter data with a using a 3rd order Butterworth filter with a cutoff
% frequency of 10 Hz.
fc = 10;
[B,A] = butter(3,fc/fn);
phi_f = filtfilt(B,A,phi);
theta_f = filtfilt(B,A,theta);

% Find initial conditions. Use the filtered angles to find the initial
% angular velocities.
phi0 = phi(1);
theta0 = theta(1);
phi_dot0 = (phi_f(2)-phi_f(1))/dt;
theta_dot0 = (theta_f(2)-theta_f(1))/dt;
clear phi_f theta_f fc B A fn;

% Call the project function. Note that the initial values are passed in
% units of degrees, and the function returns solution vectors in units of
% degrees. ** CHANGE THIS TO THE NAME OF YOUR OWN FUNCTION. THE FUNCTION
% PARAMETERS AND ORDER SHOULD STAY THE SAME. THE NAME OF YOUR FUNCTION
% SHOULD BE lastname1_lastname2() ** Your function must return
% values of phi and theta at each time step defined in the vector t.
% [phi,theta]=lagrange_colton(phi0,theta0,phi_dot0,theta_dot0,t);
tic
[phi,theta]=coe_adamson(phi0,theta0,phi_dot0,theta_dot0,t);
toc

% Plot solutions alongside experimental plot. 
figure(1);
hold on;
plot(t,phi,'k:',t,theta,'r:');
legend('\phi (measured)','\theta (measured)','\phi (modeled)','\theta (modeled)');