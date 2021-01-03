function b = rdec(B,w,t)
% Opis:
%  rdecasteljau vrne tocko na racionalni Bezierjevi
%  krivulji, ki je izracunana z de Casteljaujevim
%  postopkom, prirejenim za racionalni primer
%
% Definicija:
%  b = rdecasteljau(B,w,t)
%
% Vhodni podatki:
%  B    matrika, katere vrstica predstavlja koordinate
%       kontrolne tocke racionalne Bezierjeve krivulje,
%  w    seznam utezi racionalne Bezierjeve krivulje,
%  t    stevilo, ki doloca vrednost delilnega parametra v
%       de Casteljaujevem postopku
%
% Izhodni podatek:
%  b    vrstica, ki predstavlja tocko na racionalni
%       Bezierjevi krivulji pri parametru t

% X-koordinata

n = length(B)-1;
D1 = NaN(n+1);
W1 = zeros(n+1);
for i = 1:n+1 % naredim prvi stolpec v matriki
    D1(i,1) = B(i,1);
    W1(i,1) = w(i);
end

for j = 2:n+1
    for i = 1:(n-j+2)
        W1(i,j) = (1-t)*W1(i,j-1) + t*W1(i+1,j-1);
        D1(i,j)=(1-t)*(W1(i,j-1)/W1(i,j))*D1(i,j-1) + t*(W1(i+1,j-1)/W1(i,j))*D1(i+1,j-1);
    end
end

b1 = D1(1,n+1); % x-koord. točke, ki leži na rac. Bez. krivulji

% Y-koordinata

n = length(B)-1;
D2 = NaN(n+1);
W2 = zeros(n+1);
for i = 1:n+1 % naredim prvi stolpec v matriki
    D2(i,1) = B(i,2);
    W2(i,1) = w(i);
end
for j = 2:n+1
    for i = 1:(n-j+2)
        W2(i,j) = (1-t)*W2(i,j-1) + t*W2(i+1,j-1);
        D2(i,j)=(1-t)*(W2(i,j-1)/W2(i,j))*D2(i,j-1) + t*(W2(i+1,j-1)/W2(i,j))*D2(i+1,j-1);
    end
end

b2 = D2(1,n+1); % y-koord. točke, ki leži na rac. Bez. krivulju

b = [b1 b2];


W1;
W2;
D1;
D2;
b03 = [D1(1,4) D2(1,4)];
b13 = [D1(2,4) D2(2,4)];
w13 = [W1(2,4) W2(2,4)];
w03 = [W1(1,4) W2(1,4)];
w04 = [W1(1,5) W2(1,5)];
norm(4*(w03.*(w13))/(w04.^2)*(b13-b03))

end