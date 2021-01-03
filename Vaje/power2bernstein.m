function b = power2bernstein(p)
% Opis:
%  power2bernstein pretvori polinom, predstavljen s
%  koeficienti v potencni bazi, v polinom, predstavljen
%  v Bernsteinovi bazi
%
% Definicija:
%  b = power2bernstein(p)
%
% Vhodni podatek:
%  p    seznam koeficientov dolzine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v potencni
%       bazi od x^n do 1
%
% Izhodni podatek:
%  b    seznam koeficientov dolzine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v Bernsteinovi
%       bazi od 0-tega do n-tega Bernsteinovega baznega
%       polinoma

% p = fliplr(p) -> to samo obrne sezna, potem ni treba pisat b(n - (i -
% 1)), da gremo iz desne prot levi, ampak kar b(i - 1)

n = length(p) - 1;
b = zeros(1, n + 1);

for i = 0 : n
    for j = i : n
        b(n - (i - 1)) = b(n - (i - 1)) + (nchoosek(j, i) / nchoosek(n, i)) * p(j + 1);
    end
end