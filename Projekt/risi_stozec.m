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
s = surf(X, Y, ones(100, 100), 'FaceAlpha', 0.3);
s.EdgeColor = 'none';
hold on;
% Kroznica na stozcu: 
%x_s = 3.*cos(T);
%y_s = 3.*sin(T);
%z_s = 3.* ones(100, 100);
%surf(x_s, y_s, z_s);
% Kroznica na ravnini w = 1:
x_1 = 1.*cos(T);
y_1 = 1.*sin(T);
z_1 = ones(100, 100);
surf(x_1, y_1, z_1, 'LineWidth', 1.2);