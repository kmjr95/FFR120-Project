function impedance = CalculateCellImpedance(impedanceMatrix, i, j)
% Returns impedance for each cell computed from neighboring cells
% Neighbors in directions N,E,S,W have factor of 1/2
% Neighbors in directions NW,NE,SW,SE have factor of sqrt(2)/4

impedance = 0;

% NW
neighborValue = impedanceMatrix(i-1, j-1);
impedance = impedance + sqrt(2)*neighborValue/4;
% N
neighborValue = impedanceMatrix(i-1, j);
impedance = impedance + neighborValue/2;
% NE
neighborValue = impedanceMatrix(i-1, j+1);
impedance = impedance + sqrt(2)*neighborValue/4;
% W
neighborValue = impedanceMatrix(i, j-1);
impedance = impedance + neighborValue/2;
% E
neighborValue = impedanceMatrix(i, j+1);
impedance = impedance + neighborValue/2;
% SW
neighborValue = impedanceMatrix(i+1, j-1);
impedance = impedance + sqrt(2)*neighborValue/4;
% S
neighborValue = impedanceMatrix(i+1, j);
impedance = impedance + neighborValue/2;
% SE
neighborValue = impedanceMatrix(i+1, j+1);
impedance = impedance + sqrt(2)*neighborValue/4;

end