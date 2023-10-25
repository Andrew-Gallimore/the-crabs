## Copyright (C) 2023 eh552
## Author: eh552 <eh552@KIKAS-LAPTOP>
## Created: 2023-10-24

function penguin = getPeng (pengSize)

    % Penguin Center
    pengPt0 = [ 0; 0; 1];

    % Penguin left side

    pengPt1 = [ 4 * pengSize; pengSize; 1]; % Top head
    pengPt2 = [ 2 * pengSize; pengSize; 1]; % bottom head

    pengPt3 = [ -2 * pengSize; 2 * pengSize; 1]; % bottom torso

    pengPt4 = [ -2 * pengSize; 0.5 * pengSize; 1]; % top foot
    pengPt5 = [ -3 * pengSize; 0.5 * pengSize; 1]; % bottom foot
    pengPt6 = [ -3.5 * pengSize; 2 * pengSize; 1]; % end foot

    pengPt7 = [ pengSize; pengSize + pengSize * 0.25; 1 ];
    pengPt8 = [ 0; 3 * pengSize; 1]; % end of hand


    % Penguin right side

    pengPt9 = [ 4 * pengSize; -pengSize; 1]; % Top of head
    pengPt10 = [ 2 * pengSize; -pengSize; 1]; % bottom of head

    pengPt11 = [ -2 * pengSize; -2 * pengSize; 1]; % bottom torso

    pengPt12 = [ -2 * pengSize; -0.5 * pengSize; 1]; % top of foot
    pengPt13 = [ -3 * pengSize; -0.5 * pengSize; 1]; % bottom of foot
    pengPt14 = [-3.5 * pengSize; -2 * pengSize; 1]; % end of foot

    pengPt15 = [ pengSize; -pengSize - pengSize * 0.25; 1 ];
    pengPt16 = [0; -3 * pengSize; 1]; % end of hand


    penguin = [ pengPt1, pengPt2, pengPt3, pengPt4, pengPt5, pengPt6, pengPt7, pengPt8, pengPt9, pengPt10, pengPt11, pengPt12, pengPt13, pengPt14, pengPt15, pengPt16];

endfunction
