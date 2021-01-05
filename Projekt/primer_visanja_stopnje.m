% -- Primer višanja stopnje --

w2 = 1/3;

b0 = [1 0 1];
b1 = [0 (1/2 + 3/2*w2)^(1/2) 0];
b2 = [(-2/3 - w2) 0 w2];
b3 = [0 -(1/2 + 3/2*w2)^(1/2) 0];
b4 = [1 0 1];

B = [b0; b1; b2; b3; b4]

B1 = bezierelv(B,1)

subplot(2,2,1);
plotbezier(B,0:0.01:1)
hold on
subplot(2,2,2);
plotbezier(B1,0:0.01:1)
hold on

% plotbezier(B,0:0.01:1)
% hold on
% plotbezier(B1,0:0.01:1)
% hold on