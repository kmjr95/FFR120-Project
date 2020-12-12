solidMap = imread('bitmaps/StaticMap3.bmp');
dim1 = size(solidMap,1);
dim2 = size(solidMap,2);
[Y, X] = ind2sub([75 100], randi(dim1*dim2));
center = [Y X];
DrawState(solidMap);
R = 1;
fireMap = zeros(75,100);

for i = 1:100
    [fireMap,R] = PropagateFire(center,dim1,dim2,R);
    DrawState(solidMap + fireMap.*4);
end
