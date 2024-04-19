function result = goalmat(map,goals)

sz = size(map);
g = zeros(sz);

for i = 1:height(goals)
    g(goals(i,2),goals(i,1)) = 1;
end

result = g;

end