function spatialData = LoadSpatialData()
% This function loads the spatial layer matrices representing the
% environment of the simulation
try
    solidMap = imread('StaticObjectsMap.bmp');
    exitMap = imread('ExitMap.bmp');
end

