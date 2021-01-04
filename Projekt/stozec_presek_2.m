% Presek stožca s tangentno ravnino:

r = linspace(0, 2 * pi) ;
th = linspace(0, 2 * pi) ;
[R,T] = meshgrid(r, th) ;
X = R.*cos(T);
Y = R.*sin(T);
Z = R;
S = surf(X, Y, Z, 'FaceAlpha', 0.2);
S.EdgeColor = 'none';
hold on;

% Nariši nosilko stožca:

x = meshgrid(0 : 0.1 : 6); 
y = zeros(61, 61);
z = x - 0.1;
s = surf(x, y, z) 
s.EdgeColor = 'red';

xlabel('x');
ylabel('y');
zlabel('z');

% Nariši tangentnoravnino:
[x_r, y_r] = meshgrid(-5:0.1:10); % Generate x and y data
z_r = x_r; % Generate z data
S_r = surf(x_r, y_r, z_r) % Plot the surface
S_r.EdgeColor = 'yellow'