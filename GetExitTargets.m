function exits = GetExitTargets()

left = imread('bitmaps/LeftExit3.bmp');
right = imread('bitmaps/RightExit3.bmp');
top = imread('bitmaps/TopExit3.bmp');
down = imread('bitmaps/BotExit3.bmp');

[row, col] = find(left == 1);
exits.left = [row col];
[row, col] = find(right == 1);
exits.right = [row col];
[row, col] = find(top == 1);
exits.top = [row col];
[row, col] = find(down == 1);
exits.down = [row col];



end