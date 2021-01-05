%%% KONSTRUKCIJA %%%

% Kontrolne točke: 
B = [1 0 1; 0 1 0; -1 0 1/3; 0 -1 0; 1 0 1];
w_0 = 1;
w_1 = 0;
w_2 = 1/3;
w_3 = 0;
w_4 = 1;

W = [w_0 w_1 w_2 w_3 w_4];

t = linspace(0,1,11);

rbezier(B, W, t);
plotrbezier(B, W, t);