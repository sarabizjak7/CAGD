function db = bezierder(B,r,t)
% Opis:
%  bezierder vrne tocke na krivulji, ki predstavlja odvod
%  dane Bezierjeve krivulje
%
% Definicija:
%  db = bezierder(B,r,t)
%
% Vhodni podatki:
%  B    matrika kontrolnih tock Bezierjeve krivulje, v
%       kateri vsaka vrstica predstavlja eno kontrolno
%       tocko,
%  r    stopnja odvoda, ki ga racunamo,
%  t    seznam parameterov, pri katerih racunamo odvod
%
% Izhodni podatek:
%  db   matrika, v kateri vsaka vrstica predstavlja tocko
%       r-tega odvoda pri istoleznem parametru iz seznama t

st_parametrov = length(t);
db = size(st_parametrov, 2);
n = length(B);

stopnja = n - 1;

koeficient = factorial(stopnja) / factorial(stopnja - r);

%odvod izracunamo za vsak parameter

for i = 1 : st_parametrov
    
    X = decasteljau(B(:,1), t(i));
    Y = decasteljau(B(:,2), t(i));
    
    % r-ta diferenca z vgrajeno funkcijo diff -> vrne vektor dolzine
    % stopnja, vzamemo prvo vrstico, da dobimo vrednost, ker druge je NaN.
    b_x = diff( X(:, stopnja - (r - 1)), r);
    b_y = diff( Y(:, stopnja - (r - 1)), r);

    db(i,1) = koeficient * b_x(1);
    db(i,2) = koeficient * b_y(1);
end
    

    
    