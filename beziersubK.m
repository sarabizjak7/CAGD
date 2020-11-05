function BS = beziersubK (B , t , k)
% Opis :
%   beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija :
%   BS = beziersubK (B,t, k)
%
% Vhodni podatki :
%   B   matrika kontrolnih točk Bezierjeve krivulje , v
%       kateri vrstica predstavlja eno kontrolno točko ,
%   t   parameter subdivizije Bezierjeve krivulje
%   k   st. zaporednih subdivizij
%
% Izhodni podatek :
%   BS  celica , ki vsebuje kontrolne točke 2^k krivulj , ki
%       jih dobimo s subdivizijo prvotne Bezierjeve krivulje

n = size(B, 1);
d = size(B, 2);
BS = cell(2^k, 1);
BS{1} = B;

for i = 1 : k
   for j = 2^(i) : -2 : 2
       sub = beziersub(BS{j/2}, t);

       % Nastavimo naslednjo celico -> 
       BS{j} = sub{2};
       % Posodobimo prejsnjo, oz to, na kateri smo klicali sub
       BS{j - 1} = sub{1}; 
   end
end