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

if size(B,2) == 2
    % poligon kontrolnih to�k 
    plot(B(:,1),B(:,2),'-o'); %'-o' napi�emo, da nam ozna�i kontrolne to�ke
    hold on
    
    % nari�emo Bezierjevo krivuljo
    
    %dobljenje to�ke na krivulji:
    D = bezier(B,t);
    
    plot(D(:,1),D(:,2));
    hold off
end

if size(B,2) == 3
    % poligon kontrolnih to�k 
    plot3(B(:,1),B(:,2),B(:,3),'-o');
    hold on
    
    % nari�emo Bezierjevo krivuljo
    
    %dobljenje to�ke na krivulji:
    D = bezier(B,t);
    
    plot3(D(:,1),D(:,2),D(:,3));
    hold off
end

end

