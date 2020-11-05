function BS = beziersub(B,t)
% Opis:
%  beziersub izvede subdivizijo Bezierjeve krivulje
% 
% Definicija:
%  BS = beziersub(B,t)
%
% Vhodni podatki:
%  B    matrika kontrolnih tock Bezierjeve krivulje, v
%       kateri vrstica predstavlja eno kontrolno tocko,
%  t    parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
%  BS   celica, ki vsebuje kontrolne tocke dveh krivulj, ki
%       jih dobimo s subdivizijo prvotne Bezierjeve krivulje  

n = size(B,1);
X = decasteljau(B(:,1),t);
Y = decasteljau(B(:,2),t);

% PRVA VRSTICA, drugač zapisano kot na predavanjih
B1(:,1) = X(1,:);
B1(:,2) = Y(1,:);

% DIAGONALA, od zgoraj proti dol, zato obrnemo, da preberemo po vrsti
B2(:,1) = diag(flip(X,2));
B2(:,2) = diag(flip(Y,2));


BS = {B1 ; B2};


end