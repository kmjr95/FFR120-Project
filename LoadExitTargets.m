function exitTargets = LoadExitTargets()

% Load bitmaps
room1ex = imread('bitmaps/room1exit.bmp');
room2ex = imread('bitmaps/room2exit.bmp');
room3ex = imread('bitmaps/room3exit.bmp');
room4ex = imread('bitmaps/room4exit.bmp');
room5ex = imread('bitmaps/room5exit.bmp');
room6ex = imread('bitmaps/room6exit.bmp');
room7ex = imread('bitmaps/room7exit.bmp');
room8ex = imread('bitmaps/room8exit.bmp');
northMain = imread('bitmaps/topMainExit.bmp');
southMain = imread('bitmaps/botMainExit.bmp');
westMain = imread('bitmaps/leftMainExit.bmp');
eastMain = imread('bitmaps/rightMainExit.bmp');

% Rooms
[row, col] = find(room1ex == 1);
exitTargets.rooms.one = [row, col];
[row, col] = find(room2ex == 1);
exitTargets.rooms.two = [row, col];
[row, col] = find(room3ex == 1);
exitTargets.rooms.three = [row, col];
[row, col] = find(room4ex == 1);
exitTargets.rooms.four = [row, col];
[row, col] = find(room5ex == 1);
exitTargets.rooms.five = [row, col];
[row, col] = find(room6ex == 1);
exitTargets.rooms.six = [row, col];
[row, col] = find(room7ex == 1);
exitTargets.rooms.seven = [row, col];
[row, col] = find(room8ex == 1);
exitTargets.rooms.eight = [row, col];

% Main exits
[row, col] = find(northMain == 1);
exitTargets.main.north = [row,col];
[row, col] = find(southMain == 1);
exitTargets.main.south = [row,col];
[row, col] = find(westMain == 1);
exitTargets.main.west = [row,col];
[row, col] = find(eastMain == 1);
exitTargets.main.east = [row,col];

end

