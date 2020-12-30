%%% nal 4 %%% 

% konstante : 

d = 231 / 101;

tocke_mreze = [0 0; 0 1/3; 0 2/3; 0 1; 1/2 0; 1/2 1/3; 1/2 2/3; 1/2 1; 1 0; 1 1/3; 1 2/3; 1 1]


f = @(u,v) sin(d*u).*cos(3*v);
duf = @(u,v) d*cos(d*u).*cos(3*v);
dvf = @(u,v) -3*sin(d*u).*sin(3*v);
duuf = @(u,v) -d^2*sin(d*u).*cos(3*v);
duvf = @(u,v) -3*d*cos(d*u).*sin(3*v);
dvvf = @(u,v) -9*sin(d*u).*cos(3*v);

Df = @(u,v) [duf(u,v); dvf(u,v)];
Hf = @(u,v) [duuf(u,v) duvf(u,v); duvf(u,v) dvvf(u,v)];

%Bz = argyris(T,f,Df,Hf)