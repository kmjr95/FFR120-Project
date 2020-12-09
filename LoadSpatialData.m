function spatialData = LoadSpatialData()
% This function loads the spatial layer matrices representing the
% environment of the simulation

    spatialData.solidMap = imread('bitmaps/StaticObjectsMap.bmp');
    spatialData.exitMap = imread('bitmaps/ExitMap.bmp');
    spatialData.impedanceMap = GenerateImpedance(solidMap);
end

