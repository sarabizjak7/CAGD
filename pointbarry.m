function V = pointbarry(P, T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

A = [1 1 1 ; T(:,1)'; T(:,2)'];
P1 = [1 P]';
V = A\P1;
V = V';
end