% Zveza med Bernsteinovo in potencno bazo

% Primer 1:

b = [1 1 1 1 1 1];

p = bernstein2power(b)
%p =
%     0     0     0     0     0     1

%power2bernstein(p)
%     1     1     1     1     1     1


%Primer 2:

p = [4 7 2 8 9 1 4];

b = power2bernstein(p)
%b =
%    4.0000    4.1667    4.9333    6.7000   10.0000   16.6667   35.0000

%bernstein2power(b)
%    4.0000    7.0000    2.0000    8.0000    9.0000    1.0000    4.0000


%Primer 3:

%p = rand(1,5);
%any(p - bernstein2power(power2bernstein(p)) > 1e-15)
%  logical
%   0