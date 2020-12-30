% 1
a = 21/101;

% polinom v pot bazi
p = [-1 6 a; 5 -4 1];

% spremenimo bazo v bern

b = [power2bernstein(p(1, :)); power2bernstein(p(2,:))]

% (b(5), b(6)) je zadnja kontrolna tocka 

% razdalja :
sqrt((b(5))^2+(b(6))^2);

% PREMIK za vektor (a, 1)
b1_premik = b(1,:) + a
b2_premik = b(2,:) + 1;

% ČEZ ABSCISNO OS
b2_premik = -1 * b2_premik

% t = 0.5
t1 = 0.5;
B1 = [0.534653465346535; 3.534653465346535; 5.534653465346535];
B2 = [-2; 0; -3];

C1 = decasteljau(B1, t1);
C2 = decasteljau(B2, t1);

B_ = [B1, B2]

norm(bezier(B_, t1) - [b(5) b(6)]);


%%% ber to pow

bernstein2power(b1_premik);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3

% kontrolne tocke

c = 360/1/1;

B = [2 -1 1; 3 2 -2; 2 5 c; 4 2 -1];

t = linspace(0, 1, 100);

bezier_d(B, t);

odvod = bezierder_d(B, 1, t);

vsota = 0;
for i = 1 : length(odvod)
    vsota = vsota + odvod(i, 1)^2 + odvod(i, 2)^2 + odvod(i, 3)^2;
end;
vsota;

%%%%%%%%%%%%%%

% 4

% a

d = 60 / 101;

M = zeros(8, 2);
for j = -1 : 6
    M(j + 2, 1) = sin((pi * j) / 3);
    M(j + 2, 2) = 2 * cos((pi * j) / 4) + 1;
end;

D = zeros(6, 2);
D(1,:) = M(1,:);
D(2,:) = M(3,:);
D(3,:) = M(4,:);
D(4,:) = M(5,:);
D(5,:) = M(6,:);
D(6,:) = M(8,:);

delitev = alphaparam(D, d);

odg = max(diff(delitev));

%%%% b

cel = beziercubspline(delitev, M);
cel{3}

tocka1 = [-0.061018587490890  -0.353597369992878];
tocka2 = [-0.866025403784439   2.414213562373095];

razdalja = sqrt( (tocka1(1) - tocka2(1))^2 + (tocka1(2) - tocka2(2))^2)
