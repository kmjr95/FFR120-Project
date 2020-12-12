
function DrawState(stateMap)
dim1 = size(stateMap,1);
dim2 = size(stateMap,2);
rgb = zeros(dim1,dim2,3);

% White (Unoccupied cells)
rgb(:,:,1) = rgb(:,:,1) + (stateMap == 0);
rgb(:,:,2) = rgb(:,:,2) + (stateMap == 0);
rgb(:,:,3) = rgb(:,:,3) + (stateMap == 0);

% Black (solid objects)
rgb(:,:,1) = rgb(:,:,1) + 0.*(stateMap == 1);
rgb(:,:,2) = rgb(:,:,2) + 0.*(stateMap == 1);
rgb(:,:,3) = rgb(:,:,3) + 0.*(stateMap == 1);

% Green (Agents alive)
rgb(:,:,1) = rgb(:,:,1) + 0.*(stateMap == 2);
rgb(:,:,2) = rgb(:,:,2) + 1.*(stateMap == 2);
rgb(:,:,3) = rgb(:,:,3) + 0.*(stateMap == 2);

% yellow (Agents hurt/inactive)
rgb(:,:,1) = rgb(:,:,1) + 1.*(stateMap == 3);
rgb(:,:,2) = rgb(:,:,2) + 1.*(stateMap == 3);
rgb(:,:,3) = rgb(:,:,3) + 0.*(stateMap == 3);

% Red (fire)
rgb(:,:,1) = rgb(:,:,1) + 1.*(stateMap == 4);
rgb(:,:,2) = rgb(:,:,2) + 0.*(stateMap == 4);
rgb(:,:,3) = rgb(:,:,3) + 0.*(stateMap == 4);


imagesc(rgb)
pbaspect([dim2 dim1 1]);
set(gca,'xtick', linspace(0.5,dim2+0.5,dim2+1), 'ytick', linspace(0.5,dim1+.5,dim1+1));
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
drawnow;
end

