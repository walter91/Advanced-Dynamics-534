% HW 7 #5
% Walter Coe

hw7_2

[Rtrans, Priciple] = eig(Ioxyz);
  
R = Rtrans';
    
R = -R
    
det = det(R)

Ipriciple = R*Ioxyz*R'
