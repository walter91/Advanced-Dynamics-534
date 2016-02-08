clear; clc;

syms I

Im = [5 0 0;...
      0 10 -4;...
      0 -4 10];
  
% Im = [150 0 -100;...
%       0 250 0;...
%       -100 0 300];
 
II1 = Im - I*eye(3)

det(II1)

[Rt, other] = eig(Im)
  
R = Rt'

det = det(R)

R = -R

det(R)

Im_prime = R*Im*R'


