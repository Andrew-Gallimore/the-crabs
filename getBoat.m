## Author: eh552 <eh552@KIKAS-LAPTOP>
## Created: 2023-12-11

function boat = getBoat (boatSize)

    % left of boat
    lTopBoat = [ -6 * boatSize; -boatSize; 1];
    lBottomBoat = [ -3 * boatSize; boatSize; 1];

    % right of boat
    rTopBoat = [ 6 * boatSize; -boatSize; 1];
    rBottomBoat = [ 3 * boatSize; boatSize; 1];

    boat = [lTopBoat, lBottomBoat, rTopBoat, rBottomBoat];

endfunction
