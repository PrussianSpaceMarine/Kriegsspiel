function result = pathshow(path,map)

m2 = map;

sz = height(path);

for i = 1:sz
    m2(path(i,1),path(i,2)) = 0.25;
end

cmap = [
    0 0 0;
    0.3 0.3 0.3;
    0.5 0.5 0.5;
    0.7 0.7 0.7;
    1 0 0;
    1 1 1
];

result = m2;

imshow(m2);

end