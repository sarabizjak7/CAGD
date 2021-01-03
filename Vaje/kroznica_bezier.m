% Opisi krožnice z Bezierjevimi krivuljami.

k = 6;
fi = pi/k; % ta kot določa krožni lok od (-fi,fi)
t = 0:0.001:1;
rotacijskamatrika = [cos(2*fi) -sin(2*fi); sin(2*fi) cos(2*fi)]; 
 
%1. Določimo Bezierjevo krivuljo stopnje n = 2, ki v roboih
%interpolira krožnico ter smer njenih tangent

b0 = [cos(fi),-sin(fi)];
b1 = [1/cos(fi),0];
b2 = [cos(fi),sin(fi)];

B = [b0; b1; b2];

for i = 1:k
    b = bezier(B,t);
    plot(b(:,1),b(:,2),'r')
    hold on
    B = B*rotacijskamatrika;
end

%radialna napaka
B1 = bezier(B,t);
napaka1 = max(abs(1- (B1(:,1).^2 + B1(:,2).^2 ).^(1/2) ))

% 2. Določimo Bézierjevo krivuljo stopnje n = 3, ki v robovih interpolira
% krožnico ter njena odvoda.

c0 = [cos(fi),-sin(fi)];
c1 = [cos(fi) + 1/3*sin(fi), -sin(fi) + 1/3*cos(fi)];
c2 = [cos(fi) + 1/3*sin(fi), sin(fi) - 1/3*cos(fi)];
c3 = [cos(fi),sin(fi)];

C = [c0; c1; c2; c3];

for i = 1:k
    c = bezier(C,t);
    plot(c(:,1),c(:,2),'g')
    hold on
    C = C*rotacijskamatrika;
end

%radialna napaka
C2 = bezier(C,t);
napaka2 = max(abs(1- (C2(:,1).^2 + C2(:,2).^2 ).^(1/2) ))

% 3. Določimo Bézierjevo krivuljo stopnje n = 3, ki v robovih interpolira
% krožnico ter smer njenih tangent, poleg tega pa zanjo velja
% še b(1/2) = (1, 0). 

d0 = [cos(fi),-sin(fi)];
d1 = 1/3 * [4-cos(fi),  4*cot(fi)- 4/sin(fi) + sin(fi)];
d2 = 1/3 *[4-cos(fi), -4*cot(fi) + 4/sin(fi) - sin(fi)];
d3 = [cos(fi), sin(fi)];

D = [d0; d1; d2; d3];

for i = 1:k
    d = bezier(D,t);
    plot(d(:,1),d(:,2),'b')
    hold on
    D = D*rotacijskamatrika;
end

%radialna napaka
D3 = bezier(D,t);
napaka3 = max(abs(1- (D3(:,1).^2 + D3(:,2).^2 ).^(1/2) ))