% 2. Narišite primere sestavljenih Bézierjevih krivulj (m = 4) 
% s kontrolnimi točkami d−1 = (−5, 0), d0 = (−4, 1), d1 = (−2, −1),
% d2 = (0, 3), d3 = (3, 0), d4 = (5, 2), d5 = (7, −1) za različne
% α-parametrizacije, ki so določene na podlagi točk d−1, d1, d2, d3, d5.

D = [-5 0; -4 1; -2 -1; 0 3; 3 0; 5 2; 7 -1];

% na teh točkah naredimo α-parametrizacijo
P = [-5 0; -2 -1; 0 3; 3 0; 7 -1];
ue = alphaparam (P ,0); % [0 1 2 3 4]
uc = alphaparam (P ,0.5); % [0 1.7783 3.8930 5.9528 7.9833]
ut = alphaparam (P ,1); % [0 3.1623 7.6344 11.8771 16.0002]

% graf D
plot(D(:,1),D(:,2),'-ok')
hold on;

%enakomerna parametrizacija
zlepek1 = beziercubspline(ue,D); 

%narišemo graf
t = [0:0.01:1];
for i=1:length(zlepek1)
    plotbezier(zlepek1{i},t);
    hold on;
end

%centripetalna parametrizacija
zlepek2 = beziercubspline(uc,D);

for i=1:length(zlepek2)
    plotbezier(zlepek2{i},t);
    hold on;
end

%tetivna parametrizacija
zlepek3 = beziercubspline(ut,D);
for i=1:length(zlepek3)
    plotbezier(zlepek3{i},t);
    hold on;
end