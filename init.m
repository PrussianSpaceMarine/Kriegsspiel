%% Initialize

% Add relevant paths
addpath("defines");
addpath("pathfinding");
addpath("control");

% Pull global variables
global u um ut

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

    % Map size
    sz = size(map);

    % Transition times between stances
    transitions = [
    Inf 2 2 0 24;
    2 Inf 2 Inf Inf;
    2 2 Inf 0 24;
    Inf 0 Inf Inf Inf;
    24 24 24 24 Inf];

    % Pull units
    u = readtable("maps/" + mName + "/units.csv","ReadVariableNames",true);
    um = readtable("maps/" + mName + "/unitMove.csv","ReadVariableNames",true);
    ucount = height(u); % Unit count

    % Initialize movement weight matrices
    for i = 1:ucount
        matrix_f{i} = ones(sz); % Friendly
        matrix_e{i} = ones(sz); % Enemies
    end

end