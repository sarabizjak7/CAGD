function p = bernstein2power(b)

% Opis : 
%   bernstein2power(p) pretvori polinom, predstavljen s koeficienti 
%   v bernsteinovi bazi, v polinom, predstavljen s koeficienti v potenčni bazi
%
% Definicija:
%    p = bernstein2power(b)
%
% Vhodni podatek:
%    b    seznam koeficientov dolzine n+1, ki po vrsti pripadajo
%         razvoju polinoma stopnje n v Bernsteinovi bazi od 0-tega do
%         n-tega Bernsteinovega baznega polinoma
%
% Izhodni podatek:
%    p    seznam koeficientov dolzine n+1, ki po vrsti pripadajo
%         razvoju polinoma stopnje n v potencni bazi od x^n do 1

n = length(b) - 1;
p = zeros(1, n + 1);
for i = 0 : n
    for j = i : n 
        p(i + 1) = p(i + 1) + (-1)^(i + j) * nchoosek(n, j) * nchoosek(j, i) * b(n - (j - 1));
    end
end



        