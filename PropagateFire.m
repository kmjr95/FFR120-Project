function [fireMap,R] = PropagateFire(center,dim1,dim2,R)


[columnsInImage, rowsInImage] = meshgrid(1:dim2, 1:dim1);
centerX = center(2);
centerY = center(1);
fireMap = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= R.^2;
R = R + 1;

end

