function b = rdecasteljau1D (B1,w,t)
%deCast za racionalne za eno dimenzijo

n = size(B1, 1);
b1 = NaN(n);
W = NaN(n);
W(:, 1) = w;
b1(:, 1) = B1;

for r = 2 : n
   for i = 1 : (n - r + 1)
      W(i, r) = (1 - t) * W(i, r - 1) + t * W(i + 1, r - 1);
      b1(i, r) = (1 - t) * b1(i, r - 1) * W(i, r - 1) / W(i, r) + t * b1(i + 1, r - 1) * W(i + 1, r - 1) / W(i, r);
   end
end
b = b1(1, n);
end