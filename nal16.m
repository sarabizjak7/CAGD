Bx = [0 2 6 8;1 3 7 NaN; 2 5 NaN NaN; 4 NaN NaN NaN];
By = [0 1 0 -1; 2 2 3 NaN; 4 3 NaN NaN; 5 NaN NaN NaN];
Bz = [-2 1 -2 0; 4 -2 3 NaN; 0 5 NaN NaN; 3 NaN NaN NaN];

% plotbezier3(Bx,By,Bz,50);

trisurf(TRI,b(:,1),b(:,2),b(:,3));