function [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
% Opis:
%  bezier2 vrne tocke na Bezierjevi ploskvi iz tenzorskega
%  produkta
%
% Definicija:
%  [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate kontrolnih tock,
%  u, v         vrstici dolzine M in N, ki predstavljata
%               parametre v smereh u in v
%
% Izhodni podatki:
%  bx, by, bz   matrike velikosti N x M, ki predstavljajo
%               tocke na Bezierjevi ploskvi:
%               [bx(J,I) by(J,I) bz(J,I)] je tocka pri
%               parametrih u(I) in v(J)

m = size(u,2);
n = size(v,2);

bx = zeros(n,m);
by = zeros(n,m);
bz = zeros(n,m);

m1 = size(Bx, 2);
n1 = size(Bx,1);
for i = 1:m
    for j = 1:n    
        bx1 = zeros(m1,1);
        by1 = zeros(m1,1);
        bz1 = zeros(m1,1);
        for k =1:m1
            kx1 = decasteljau (Bx(:,k), v(1,j));
            bx1(k,1) = kx1(1,n1);
            ky1 = decasteljau (By(:,k), v(1,j));
            by1(k,1) = ky1(1,n1);
            kz1 = decasteljau (Bz(:,k), v(1,j));
            bz1(k,1) = kz1(1,n1);
        end
        kx2 = decasteljau(bx1, u(i));
        bx(j,i) = kx2(1,m1);
        ky2 = decasteljau(by1, u(i));
        by(j,i) = ky2(1,m1);
        kz2 = decasteljau(bz1, u(i));
        bz(j,i) = kz2(1,m1);
    end
end
end