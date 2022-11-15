v = [2 4 7 -1 0.4 -5]
w = [-2; 0.6; 4; 0.1; 0; 9]
a = v + w
b = v * w
c = v + w
for i = 1 : length(v)
if mod(i,2) == 0
d = v(i)

for i = 1 : 5
e(i, :) = v
end

for i = 1 : 5
for j = 1 : 6
if mod(e(i,j),4) == 0
f(:,:) = e(i,j)
end
end
end

g = w * v

h = [g(2:4, 1:3)]

v = 1:1:10

a = [v.*v]

for i = 1 : length(a)
if mod(e(i),3) == 0
b(i) = a(i)
else
    b(i) = 0
end
end

for i = 1 : length(b)
d = [b(i);]
end

e = [linspace(4, 20, 5); linspace(4, 20, 5); linspace(4, 20, 5)]
