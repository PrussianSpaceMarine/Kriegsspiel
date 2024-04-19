function result = createUnit(existing)

% Unit ID
u = max(existing{:,1}) + 1;

f = input("Faction (1 == red, 2 == blue):");

disp('--------------')
disp('Existing Corps')
disp(existing{existing{:,"f"} == f,"c"})
c = input("Corps:");

% Division # in corps
d = max(existing{existing{:,"f"} == f & existing{:,"c"} == c,"d"}) + 1;

d_n = input("\nDivision Name:");

% No officer initially
off = 0;

inf = input("\nInfantry Count:");
cav = input("\nCavalry Count:");
art = input("\nGun Count:");

morale_b = input("\nBase Morale:");

loss = 0;
fatigue = 0;

xp = input("\nExperience Modifier:");

inf_e = inf;
cav_e = cav;

morale_c = morale_b;

ammo = 1;

% Inf/cav proportions
inf_p = inf / (inf + cav);
cav_p = cav / (inf + cav);

add = {u,f,c,d,d_n,off,inf,cav,art,morale_b,loss,fatigue,xp,inf_e,cav_e,morale_c,ammo,inf_p,cav_p};

existing = [existing;add];

result = existing;

end