function id = FindRoomId(pos)
%Calculates which room an agent is currently in based on position
row = pos(1);
col = pos(2);

if row > 75 || row < 1 || col > 100 || col < 1
    msg = 'Invalid position';
    error(msg);
end

% Room 0
room0 = (row >= 20 && row <= 55) || (38 <= col && col <= 61);
% Upper rooms [1 2 3 4]
upperRooms = (row >= 2 && row <= 19);
% Lower rooms [5 6 7 8]
lowerRooms = (row >= 55 && row <= 74);



if room0
    id = 0;
elseif upperRooms
    if (col >= 2 && col <= 18)
        id = 1;
    elseif (col >= 20 && col <= 36)
        id = 2;
    elseif (col >= 63 && col <= 80)
        id = 3;
    else
        id = 4;
    end
elseif lowerRooms
    if (col >= 2 && col <= 18)
        id = 5;
    elseif (col >= 20 && col <= 36)
        id = 6;
    elseif (col >= 63 && col <= 80)
        id = 7;
    else
        id = 8;
    end
else
    msg = 'Could not determine room';
    error(msg);
end
end

