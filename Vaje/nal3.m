%%% nal 3 %%%

% konstante :

c = 85 / 101;

% a 

T = [-1 -1; 3 0; 0 4];
P = [c 0];

pointbarry(P, T);

rezultat1 = 0.454403335070349 * 0.431995831162064 * 0.113600833767587

% b

barry = pointbarry(P, T);
Bx = [0 5 9; 4 6 NaN; 6 NaN NaN];
By = [1 -1 0; 5 4 NaN; 6 NaN NaN];
Bz = [ 4 -3 0; -1 5 NaN; 5 NaN NaN];
 
bezier3(Bx, By, Bz, barry);

rezultat2 = sqrt ((4.721883765129755)^ 2 + (0.800119264826842) ^ 2 + (0.100162902936299) ^ 2)

% c

odv = vectorbary([3/5 4/5], T);

bloss1 = blossom3(Bx, [odv; barry]);
bloss2 = blossom3(By, [odv; barry]);
bloss3 = blossom3(Bz, [odv; barry]);

rezultat3 = sqrt ((2 * bloss1) ^ 2 + (2 * bloss2) ^ 2 + (2 * bloss3) ^ 2)

