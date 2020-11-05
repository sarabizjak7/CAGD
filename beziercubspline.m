function B = beziercubspline(u,D)
% Opis:
%  beziercubspline izracuna sestavljeno Bezierjevo krivuljo
%  stopnje 3, ki je dvakrat zvezno odvedljiva v stikih
%
% Definicija:
%  B = beziercubspline(u,D)
%
% Vhodna podatka:
%  u    seznam parametrov delitve dolzine m+1,
%  D    matrika, v kateri vsaka izmed m+3 vrstic predstavlja
%       eno kontrolno tocko sestavljene krivulje
%
% Izhodni podatek:
%  B    seznam dolzine m, v kateri je vsak element matrika s
%       stirimi vrsticami, ki dolocajo kontrolne tocke kosa
%       sestavljene krivulje

[n,d] = size(D); % n predstavlja m+3 kontrolnih točk, d je dimenzija 
m = n - 3; % imamo m odsekov

dif = diff(u); % diference

B = cell(1, m); % seznam dolžine m
for i = 1 : m
    B{i} = zeros(4, d); % vsak element je matrika s štirimi vrsticami,
                       % ki določajo kontrolne točke kosa sestavljene krivulje
end             

% Najprej napišemo kontrolne točke na robu.

% začetne robne točke
B{1}(1,:) = D(1,:); % b_0=d_-1
B{1}(2,:) = D(2,:); % b_1=d_0
B{1}(3,:) = (dif(2) / (dif(1) + dif(2))) * D(2,:) + (dif(1) / (dif(1) + dif(2))) * D(3,:);

% končne robne točke
B{m}(4,:) = D(m+3,:); % b_3=d_(m+1)
B{m}(3,:) = D(m+2,:); % b_2=d_m
B{m}(2,:) = (dif(m) / (dif(m-1) + dif(m))) * D(m+1,:) + (dif(m-1) / (dif(m-1) + dif(m))) * D(m+2,:);

%popravimo indekse D-ja tako, da tečejo od 1 do m+1
D = D(3:end,:); %ker 1. in 2. vrstice (torej d_-1 in d_0) ne rabimo več

% vmesne točke

for i = 1:(m-2)
    B{i+1}(2,:) = ((dif(i+1) + dif(i+2)) / (dif(i) + dif(i+1) + dif(i+2))) * D(i,:) + (dif(i) / (dif(i) + dif(i+1) + dif(i+2))) * D(i+1,:);
    B{i+1}(3,:) = ((dif(i+2)) / (dif(i) + dif(i+1) + dif(i+2))) * D(i,:) + ((dif(i) + dif(i+1)) / (dif(i) + dif(i+1) + dif(i+2))) * D(i+1,:);
end

for i = 1:m-1
    vsota = dif(i+1) / (dif(i) + dif(i+1)) * B{i}(3,:) + dif(i) / (dif(i) + dif(i+1)) * B{i+1}(2,:);
    B{i}(4,:) = vsota;
    B{i+1}(1,:) = vsota;
end

end