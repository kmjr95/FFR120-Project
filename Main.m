% Parameters
N_AGENTS = 100;
SIM_MODE = 0; % 0 panic, 1 altrustic model

% Initialization
spatialData = LoadSpatialData();
exitTargets = LoadExitTargets();
[agentMap, agentList] = InitializeAgentPositions(spatialData.solidMap,...
    N_AGENTS);
spatialData.agentMap = agentMap;
