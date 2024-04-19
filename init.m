%% Initialize

% Add relevant paths
addpath("defines");
addpath("pathfinding");
addpath("control");

% Pull global variables
global ut

% Unit type information
ut = readtable("unitInfo.csv");

%% Load Map Information

mName = input("Enter the map to use:\n","s");

if mName ~= "qq"
    
    % Read map information
    map = readmatrix("maps/" + mName + "/map.csv");
    mov = ones(size(map));

    for i = 1:height(map)
        for j = 1:width(map)

            val = map(i,j);
            switch val
                case 0.7 % Clear off-road
                    mov(i,j) = 1.3333;
                case 0.5 % Difficult terrain
                    mov(i,j) = 1.5;
                case 0.3 % Extreme terrain
                    mov(i,j) = 1.6667;
                case 0.1 % River
                    mov(i,j) = 5;
            end

        end
    end

    % Pull units
    u = readtable("maps/" + mName + "/units.csv","ReadVariableNames",true);

end