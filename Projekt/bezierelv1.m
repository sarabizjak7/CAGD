function  Be = bezierelv1(B)
% Opis:
%   bezierelv1  izvede  visanje  stopnje  dane  Bezierjeve  krivulje za 1
%
% Definicija:
%   Be = bezierelv(B)
%
% Vhodna  podatka:
%  B   matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
%      predstavlja d-dimenzionalno  kontrolno  tocko
%      Bezierjeve  krivulje  stopnje n,
% 
% Izhodni  podatek:
%  Be   matrika  velikosti (n+2) x d, v kateri  vsaka
%       vrstica  predstavlja d-dimenzionalno  kontrolno  tocko
%       Bezierjeve  krvulje  stopnje n+1, ki  ustreza  dani
%       Bezierjevi  krivulji

[n,d] = size(B); % matrika velikosti (n+1)*d

Be = zeros(n+1,d);

Be(1,:) = B(1,:); % prva točka ostane enaka
Be(n+1,:) = B(n,:); % zadnja točka ostane enaka

% pri b_i ostanejo isti indeksi, pri ostalih i-jih jih mors pa
% spreminjat!!!

for i = 2:n
    Be(i,:) = B(i-1,:)*((i-1)/(n)) + B(i,:)*(1-((i-1)/(n)));
end

end
