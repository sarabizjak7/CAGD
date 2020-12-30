T =[0 0;5 1;3 3];
t1 = [0 0];
t2 = [1 1];
t3 = [4 2];
x = [1 0];
y = [0 1];
P1 = pointbarry(T,t1)
P2 = pointbarry(T,t2)
P3 = pointbarry(T,t3)
Px = pointvector(T,x)
Py = pointvector(T,y)
B=[2 1 -1 0;5 3 -4 NaN; 0 0 NaN NaN; 1 NaN NaN NaN];
vrednost1 = decasteljau3(B,P1)
vrednost2 = decasteljau3(B,P2)
vrednost3 = decasteljau3(B,P3)


odvod_x_P1 =(factorial(3)/factorial(3-1))* blossom3(B, [Px;P1;P1])
odvod_xy_P1 = (factorial(3)/factorial(3-2))* blossom3(B, [Px;Py;P1])
odvod_xy_P1 = (factorial(3)/factorial(3-2))* blossom3(B, [Px;Px;P1])
odvod_xy_P1 = (factorial(3)/factorial(3-2))* blossom3(B, [Py;Py;P1])
