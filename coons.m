function [Bx,By,Bz] = coons(Bx,By,Bz)
% Opis:
%  coons vrne kontrolne tocke Coonsove ploskve
%
% Definicija:
%  [Bx,By,Bz] = coons(Bx,By,Bz)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate robnih kontrolnih tock
%               (v konstrukciji Coonsove ploskve se
%               upostevajo kontrolne tocke, ki jih doloca
%               prva in zadnja vrstica ter prvi in zadnji
%               stolpec posamezne matrike)
%
% Izhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate kontrolnih tock Coonsove ploskve

m = size(Bx,1)-1;
n = size(Bx,2)-1;
for i=1:(m-1)
    for j=1:(n-1)
        bx1 = (1-j/n)*Bx(i+1,1) +(j/n)*Bx(i+1,n+1);
        by1 = (1-j/n)*By(i+1,1) +(j/n)*By(i+1,n+1);
        bz1 = (1-j/n)*Bz(i+1,1) +(j/n)*Bz(i+1,n+1);
        bx2 = (1-i/m)* Bx(1,j+1) + (i/m)*Bx(m+1,j+1);
        by2 = (1-i/m)* By(1,j+1) + (i/m)*By(m+1,j+1);
        bz2 = (1-i/m)* Bz(1,j+1) + (i/m)*Bz(m+1,j+1);
        bx3 = ((1-i/m)*(1-j/n)*Bx(1,1) + (1-i/m)*(j/n)*Bx(1,n+1) +(i/m)*(1-j/n)*Bx(m+1,1)+ (i*j)*Bx(m+1,n+1)/(m*n));
        by3 = ((1-i/m)*(1-j/n)*By(1,1) + (1-i/m)*(j/n)*By(1,n+1) +(i/m)*(1-j/n)*By(m+1,1)+ (i*j)*By(m+1,n+1)/(m*n));
        bz3 = ((1-i/m)*(1-j/n)*Bz(1,1) + (1-i/m)*(j/n)*Bz(1,n+1) +(i/m)*(1-j/n)*Bz(m+1,1)+ (i*j)*Bz(m+1,n+1)/(m*n)); 
        Bx(i+1,j+1) = bx1+bx2-bx3;
        By(i+1,j+1) = by1+by2-by3;
        Bz(i+1,j+1) = bz1+bz2-bz3;
    end
end

end