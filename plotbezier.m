function plotbezier(B,t)
% Opis:
%  plotbezier narise Bezierjevo krivuljo za dane kontrolne
%  tocke in seznam parametrov
%
% Definicija:
%  plotbezier(B,t)
%
% Vhodni podatki:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne
%       tocke Bezierjeve krivulje stopnje n v
%       d-dimenzionalnem prostoru,
%  t    seznam parametrov dolzine k, pri katerih racunamo
%       vrednost Bezierjeve krivulje

if size(B, 2) == 2
    plot(B(:,1), B(:,2), 'b-o')
    
    hold on
    D = bezier(B, t)
    plot(D(:,1), D(:,2), 'r-o')
    hold off
end

if size(B, 2) == 3
    plot(B(:,1), B(:,2), B(:,3), 'b-o')
    
    hold on
    D = bezier(B, t)
    plot(D(:,1), D(:,2), D(:,3), 'r-o')
    hold off
end