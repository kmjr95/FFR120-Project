% Parameters
N_AGENTS = 100;
SIM_MODE = 0; % 0 panic, 1 altrustic model
t = 0;

% Initialization
spatialData = LoadSpatialData();
exitTargets = LoadExitTargets();
[agentMap, agentList] = InitializeAgentPositions(spatialData.solidMap,...
    N_AGENTS);
spatialData.agentMap = agentMap


% Main loop

    % Check agents on same tiles as fire
    % Check agents on main room exits (evacuate) (pos == escape target)
    % Check agents on room exits (pos == escape target)
    
