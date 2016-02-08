clear; clc;

syms t

A = sym('A(t)')
dA = diff(A,t)

A2 = t+t^3
dA2 = diff(A2, t)