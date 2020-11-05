% 2. NALOGA: Na primeru preverite pravilnost delovanja metode bezierder,
% tako da izračunate odvode kot vrednosti ustrezne Bezierjeve krivulje
% stopnje n - r.

% fiksiramo r = 1 za naš primer

function odvod = bezierder2 (B, t)

st_parametrov = length(t);
db = zeros(st_parametrov, 2);
n = length(B) - 1; % stopnja prvotnega

stopnja = n - 1; % stopnja odvoda

for j = 1 : st_parametrov
    for i = 1 : n
            % X:
            db(j, 1) = db(j, 1) + (B(i + 1, 1) - B(i, 1)) * nchoosek(n, i) *  t(j)^(i - 1) * (1 - t(j))^(n - i);
            % Y:
            db(j, 2) = db(j, 2) + (B(i + 1, 2) - B(i, 2)) * nchoosek(n, i) *  t(j)^(i - 1) * (1 - t(j))^(n - i);
    end
end

%Za odvod še vsak člen v db pomnožimo s stopnjo + 1

odvod = zeros(st_parametrov, 2);
for k = 1 : st_parametrov
    odvod(k, 1) = n * db(k, 1);
    odvod(k, 2) = n * db(k, 2);
end
    
