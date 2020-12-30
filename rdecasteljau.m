function b = rdecasteljau (B,w,t)
% Opis :
% rdecasteljau vrne tocko na racionalni Bezierjevi
% krivulji , ki je izracunana z de Casteljaujevim
% postopkom , prirejenim za racionalni primer
%
% Definicija :
% b = rdecasteljau (B,w,t)
%
% Vhodni podatki :
% B matrika , katere vrstica predstavlja koordinate
% kontrolne tocke racionalne Bezierjeve krivulje ,
% w seznam uteži racionalne Bezierjeve krivulje ,
% t število , ki doloca vrednost delilnega parametra v
% de Casteljaujevem postopku
%
% Izhodni podatek :
% b vrstica , ki predstavlja tocko na racionalni
% Bezierjevi krivulji pri parametru t

n = size(B, 2);
b = zeros(1, n);
odv = zeros(1, n)
for i = 1 : n
   b(i) = rdecasteljau1D(B(:, i), w, t);
end

end