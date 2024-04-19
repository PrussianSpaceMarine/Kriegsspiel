function area = los(map,uX,uY,recon)

% Map size
sz = size(map);

minX = max(1,uX - recon);
maxX = min(sz(2),uX + recon);

minY = max(1,uY - recon);
maxY = min(sz(1),uY + recon);

area = zeros(sz);

for x = minX:maxX+1
    for y = minY:maxY+1
        gapX = uX - x;
        gapY = uY - y;

        blind_t = 1;
        switch map(y,x)
            case 0.7 % Clear off-road
                blind_t = 1.05;
            case 0.5 % Difficult terrain
                blind_t = 1.6;
            case 0.3 % Extreme terrain
                blind_t = 2.0;
            case 0.1 % River
                blind_t = 1.0;
        end

        dist = sqrt(gapX^2 + gapY^2) * blind_t;
        if (recon >= dist || recon == 1) && x<=maxX && y<=maxY
            area(y,x) = 1;
        end
    end
end

end