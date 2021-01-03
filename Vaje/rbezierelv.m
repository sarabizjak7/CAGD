function [Be,we] = rbezierelv(B,w)
% Opis:
%  rbezierelv izvede visanje stopnje dane racionalne
%  Bezierjeve krivulje
%
% Definicija:
%  [Be,we] = rbezierelv(B,w)
%
% Vhodna podatka:
%  B    matrika velikosti (n+1) x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno tocko
%       racionalne Bezierjeve krivulje stopnje n,
%  w    seznam utezi racionalne Bezierjeve krivulje
%
% Izhodni podatek:
%  Be   matrika velikosti n+2 x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno tocko
%       racionalne Bezierjeve krvulje stopnje n+1, ki je
%       prirejena dani racionalni Bezierjevi krivulji,
%  we   seznam dolzine n+2, v katerem vsak element
%       predstavlja utez racionalne Bezierjeve krvulje
%       stopnje n+1, ki je prirejena dani racionalni
%       Bezierjevi krivulji

n = size(B, 1);
d = size(B, 2);
t1 = zeros(n, d + 1);
t1 (:, d + 1) = w;
for i = 1 : n
    for j = 1 : d
        t1(i, j) = w(i) * B(i, j);
    end
end

elv = bezierelv1(t1);

we = elv(:, d + 1);
Be = zeros(n + 1, d);
for i = 1 : n + 1
    for j = 1 : d
        Be(i, j) = elv(i, j) / we(i);
    end
end

end