function B = lsqbezier2(m,n,P)
% Opis:
%  lsqbezier2 vrne kontrolne tocke tenzorskega polinoma, ki
%  po metodi najmanjsih kvadratov najbolje aproksimira dane
%  podatke
%
% Definicija:
%  B = lsqbezier2(m,n,P)
%
% Vhodni podatki:
%  m,n      parametra, ki dolocata stopnjo polinoma,
%  P        matrika podatkov, ki v vsaki vrstici vsebuje
%           parametra z intervala [0,1] ter njima
%           pripadajoco vrednost, ki jo aproksimiramo
%
% Izhodni podatek:
%  B        matrika velikosti n+1 x m+1, ki vsebuje
%           koeficiente polinoma, ki po metodi najmanjsih
%           kvadratov najbolje aproksimira dane podatke

k = size(P,1);

%nastavimo matriko B1
B1 = zeros(k, (m+1)*(n+1));

BN = eye(n+1);
BM = eye (m+1);

for i=1:n+1
    for j =1:m+1
        B_u = bezier_lsq(BN(:,i),P(:,2)');
        B_v = bezier_lsq(BM(:,j), P(:,1)');
        B1(:,(j-1)*(n+1) + i) = B_v.*B_u;
    end
end

%display(B1);
%predoločen sistem rešimo z /
f = P(:,3);

b = B1\f;

B = reshape(b, [n+1, m+1]);
end