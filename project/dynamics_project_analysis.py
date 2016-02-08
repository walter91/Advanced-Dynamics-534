# -*- coding: utf-8 -*-
"""
Created on Wed Apr 08 07:36:48 2015

@author: wcoe
"""

from sympy import *

init_printing(use_unicode=True)

t = symbols('t')
phi, theta = symbols('phi theta')
I1zz, Izz, Iyy, Ixx, Ixz = symbols('I1zz Izz Iyy Ixx Ixz')
m2, h2, g = symbols('m2 h2 g')

Q1, Q2 = symbols('Q1 Q2')

L = (1/2.0)*(Ixx*diff(theta(t),t)**2 + I1zz*diff(phi(t), t)**2 + Izz*diff(phi(t), t)**2*cos(theta(t))**2 + Iyy*diff(phi(t),t)**2*sin(theta(t))**2 - 2*diff(theta(t),t)*diff(phi(t),t)*cos(theta(t))*Ixz) + m2*g*h2*cos(theta(t))

dLdPhi = diff(L, phi(t))

dLdPhiDot = diff(L, diff(phi(t),t))

ddt_dLdPhiDot = diff(dLdPhiDot, t)

dLdTheta = diff(L, theta(t))

dLdThetaDot = diff(L, diff(theta(t),t))

ddt_dLdThetaDot = diff(dLdThetaDot, t)

EOM = [Eq( ddt_dLdThetaDot - dLdTheta, Q1),Eq( ddt_dLdPhiDot - dLdPhi, Q2)]

print(EOM[0])
print('\n\n')
print(EOM[1])