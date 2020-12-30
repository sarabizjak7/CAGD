%%% nal 1 %%%

% Rac B krivulja

% konstante: 

a = 142 / 101;

% kontrolne tocke in utezi: 

B = [0 a; 2, 0; -4 -3; 2 -4; 0 3];
w = [1 2 0.5 a 1];

% a

tocka = rdecasteljau(B, w, 0.3);
razdalja1 = sqrt( (1.015106315599329)^2 + (-0.351293072499280)^2);

% b

f1 = w(2) / (w(2) + w(2 + 1)) * B(2, :) + w(2 + 1) / (w(2) + w(2 + 1)) * B(2 + 1, :);

% zvisamo
[B1,w1] = rbezierelv(B,w);

f2 = w1(2) / (w1(2) + w1(2 + 1)) * B1(2, :) + w1(2 + 1) / (w1(2) + w1(2 + 1)) * B1(2 + 1, :);

razdalja2 = sqrt( (0.800000000000000 - 1.241379310344828)^2 + (-0.600000000000000 - -0.213383407306248)^2);

% c

% izpisemo
rdec(B, w, 0.3)


