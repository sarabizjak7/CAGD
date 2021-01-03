function b = bezier(B,t)
% Opis:
%  bezier vrne tocke na Bezierjevi krivulji pri danih
%  parametrih
%
% Definicija:
%  b = bezier(B,t)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne
%       tocke Bezierjeve krivulje stopnje n v
%       d-dimenzionalnem prostoru,
%  t    seznam parametrov dolzine k, pri katerih racunamo
%       vrednost Bezierjeve krivulje
%
% Izhodni podatek:
%  b    matrika velikosti k x d, kjer i-ta vrstica
%       predstavlja tocko na Bezierjevi krivulji pri
%       parametru iz t na i-tem mestu

n = length(t);
nb = length(B);
% pripravimo matriko z dvemi stolpci : 2 dim točke
b = zeros(n,2);

for i = 1 : n
    X = decasteljau(B(:,1), t(i));
    Y = decasteljau(B(:,2), t(i));
    b(i, 1) = X(1, nb);
    b(i, 2) = Y(1, nb);
end