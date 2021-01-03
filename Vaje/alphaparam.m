function u = alphaparam(P,a)
% Opis:
%  alphaparam sestavi alfa parametrizacijo oziroma delitev
%  domene na podlagi podanih tock
%
% Definicija:
%  u = alphaparam(P,a)
%
% Vhodna podatka:
%  P    matrika z m+1 vrsticami, v kateri vsaka vrstica
%       predstavlja eno tocko,
%  a    parameter, ki doloca alfa parametrizacijo
%
% Izhodni podatek:
%  u    seznam parametrov delitve, ki so doloceni rekurzivno
%       tako, da se trenutnemu parametru iz seznama u
%       pristeje z a potencirana norma razlike zaporednih
%       tock iz seznama P

% Če izberemo α = 0, dobimo enakomerno parametrizacijo, ki je 
% neodvisna od podatkov. Izbiri α = 1 in α = 1/2 vodita k tetivni
% in centripetalni parametrizaciji. V splošnem tovrstne izbire
% delilnih parametrov imenujemo α-parametrizacije.


m = size(P);
u = zeros(1,m(1));

for i = 2:m(1)
   u(i) = u(i-1) + norm(P(i,:) - P(i-1,:))^a;
end

end