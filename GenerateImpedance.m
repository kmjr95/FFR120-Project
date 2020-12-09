function impedanceMatrix = GenerateImpedance(bordersMap)

forceValue = 1;
height = size(bordersMap,1);
width = size(bordersMap,2);

impedanceMatrix = zeros(height,width);
impedanceMatrix = impedanceMatrix + bordersMap.*forceValue;
tmpImpedance = zeros(height,width);

% Impedance matrix first round
for i = 2:(height-1)
    for j = 2:(width-1)
        if impedanceMatrix(i,j) == 0
            tmpImpedance(i,j) = CalculateCellImpedance(impedanceMatrix,i,j);
        end
    end
end
impedanceMatrix = impedanceMatrix + tmpImpedance;

% Impedance matrix second round
% for i = 2:(height-1)
%     for j = 2:(width-1)
%         if impedanceMatrix(i,j) == 0
%             tmpImpedance(i,j) = CalculateCellImpedance(impedanceMatrix,i,j);
%         end
%     end
% end
% impedanceMatrix = impedanceMatrix + tmpImpedance

impedanceMatrix = impedanceMatrix ./ (2 * max(impedanceMatrix(:)));
borderIndex = find(bordersMap);
impedanceMatrix(borderIndex) = 1;

end