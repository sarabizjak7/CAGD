% -- Primer višanja stopnje --

w2 = 1/3;

b0 = [1 0 1];
b1 = [0 (1/2 + 3/2*w2)^(1/2) 0];
b2 = [(-2/3 - w2) 0 w2];
b3 = [0 -(1/2 + 3/2*w2)^(1/2) 0];
b4 = [1 0 1];

B = [b0; b1; b2; b3; b4]
B1 = bezierelv(B,1)

% kontrolne tocke
kontrolne_X = B(:,1);
kontrolne_Y = B(:,2);
kontrolne_Z = B(:,3);

% kontrolne tocke zvisane krivulje
kontrolne2_X = B1(:,1);
kontrolne2_Y = B1(:,2);
kontrolne2_Z = B1(:,3);

kontrolne3_X = B1(:,1)./B1(:,3);
kontrolne3_Y = B1(:,2)./B1(:,3);
kontrolne3_Z = B1(:,3)./B1(:,3);

% Tocke na bezierjevi krivulji
tocke = bezier(B,linspace(0,1,100));
tocke2 = bezier(B1,linspace(0,1,100));

% Stozec in ravnina w = 1
r = linspace(0, 2 * pi) ;
th = linspace(0, 2 * pi) ;
[R,T] = meshgrid(r, th) ;
% Stozec:
X = R.*cos(T);
Y = R.*sin(T);
Z = R;
S = surf(X, Y, Z, 'FaceAlpha', 0.3);
S.EdgeColor = 'none';
hold on;
%Ravnina w = 1:
s = surf(X, Y, ones(100, 100), 'FaceAlpha', 0.2);
s.EdgeColor = 'none'; 
hold on;

% Racionalno krivuljo dobimo tako, da osnovno bezierjevo krivuljo
% preslikamo na ravnino w=1 s projektivno projekcijo. 
racionalna_X = tocke(:,1);
racionalna_Y = tocke(:,2);
racionalna_Z = tocke(:,3);

for i=1:size(racionalna_X,1)
    racionalna_X(i) = racionalna_X(i)/racionalna_Z(i);
    racionalna_Y(i) = racionalna_Y(i)/racionalna_Z(i);
    racionalna_Z(i) = racionalna_Z(i)/racionalna_Z(i);
end

% Tocke krivulje
X = tocke(:,1);
Y = tocke(:,2);
Z = tocke(:,3);

hold on 

grid on
axis equal

axis([-5,5,-5,5,-2,2])

% Narisemo krivuljo v 3D
plot3(X,Y,Z, 'r', 'LineWidth', 1.2)
% Narisemo krivuljo projecirano na ravnino z = 1
plot3(racionalna_X, racionalna_Y, racionalna_Z, 'c', 'LineWidth', 1.2)
% Narisemo kontrolne tocke bezierjeve krivulje
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '.r', 'MarkerSize', 15)
% Narisemo kontrolni poligon
plot3(kontrolne_X, kontrolne_Y, kontrolne_Z, '-r', 'LineWidth', 0.7)

pause

% Narisemo kontrolne to?ke zvisane bezierjeve krivulje
plot3(kontrolne2_X, kontrolne2_Y, kontrolne2_Z, '.b', 'MarkerSize', 15)
% Narisemo kontrolni poligon
plot3(kontrolne2_X, kontrolne2_Y, kontrolne2_Z, '--b', 'LineWidth', 0.7)
hold on
% Narisemo kontrolne to?ke zvisane bezierjeve krivulje na w=1
plot3(kontrolne3_X, kontrolne3_Y, kontrolne3_Z, '.c', 'MarkerSize', 15)
% Narisemo kontrolni poligon
plot3(kontrolne3_X, kontrolne3_Y, kontrolne3_Z, '-c', 'LineWidth', 0.5)

