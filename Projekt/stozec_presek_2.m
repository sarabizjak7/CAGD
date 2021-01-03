% Presek stožca s tangentno ravnino:

r = linspace(0, 2 * pi) ;
th = linspace(0, 2 * pi) ;
[R,T] = meshgrid(r, th) ;
X = R.*cos(T);
Y = R.*sin(T);
Z = R;
surf(X, Y, Z);
hold on;

% Nariši nosilko stožca:

x = meshgrid(0 : 0.1 : 10); 
y = zeros(101, 101);
z = x;
s = surf(x, y, z) 
s.EdgeColor = 'red'

xlabel('x');
ylabel('y');
zlabel('z');

% Nariši tangentnoravnino:
[x_r, y_r] = meshgrid(-10:0.1:10); % Generate x and y data
z_r = x_r; % Generate z data
S_r = surf(x_r, y_r, z_r) % Plot the surface
S_r.EdgeColor = 'yellow'