function b = bezier_d(B,t)
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

[n,d] = size(B);
n = n-1; % n točk v d-dimenzionalnem prostoru
b = zeros(length(t),d);


for i = 1:length(t)
    for j = 1:d
        D = decasteljau(B(:,j),t(i));
        b(i,j) = D(1,n+1);
end

b;
end