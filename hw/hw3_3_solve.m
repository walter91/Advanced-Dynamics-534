function [ ddot ] = hw3_3_solve( t, y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global omega m mu g

ddot = [y(2); (omega^2*y(1)*m - mu*sqrt((2*omega*y(2)*m)^2 + (m*g)^2))/m];


end

