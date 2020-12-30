%%% nal 2 %%%

% konstante : 

b = 156 / 101;

% a

Bx = [0 2 5 7; 1 0 0 9; 0 3 5 8];
By = [b 3 0 2; 5 0 0 6; 8 9 7 9];
Bz = [b 3 3 0; 0 0 0 5; 1 4 5 7];

[X, Y, Z] = coons(Bx, By, Bz);

t1 = [0 b b];
t2 = [X(2, 2) Y(2, 2) Z(2, 2)];

razdalja3 = sqrt( (t1(1) - t2(1))^2 + (t1(2) - t2(2))^2 + + (t1(3) - t2(3))^2)

% b

[X, Y, Z] = coons(Bx, By, Bz);

t3 = [0 b b];
t4 = [X(2,3) Y(2,3) Z(2,3)]

[x y z] = bezier2(X, Y, Z, 0.75, 0.5)
razdalja3 = sqrt( (x - t4(1))^2 + (y - t4(2))^2 + + (z - t4(3))^2)

% c

% [x1 x2 x3] = bezier2(X, Y, Z, 0.75, linspace(0, 1, 10))

