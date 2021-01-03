% B polinomi stopnje 5

b1 = [1 0 0 0 0];
p1 = bernstein2power(b1);
b2 = [0 1 0 0 0];
p2 = bernstein2power(b2);
b3 = [0 0 1 0 0];
p3 = bernstein2power(b3);
b4 = [0 0 0 1 0];
p4 = bernstein2power(b4);
b5 = [0 0 0 0 1];
p5 = bernstein2power(b5);

x = linspace(0,1,100);

y1 = polyval(p1,x);
y2 = polyval(p2,x);
y3 = polyval(p3,x);
y4 = polyval(p4,x);
y5 = polyval(p5,x);

hold on
plot(x,y1)
plot(x,y2)
plot(x,y3)
plot(x,y4)
plot(x,y5)
hold off
