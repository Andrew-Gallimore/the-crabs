 function crab = getCrab (size )

  % This function stores and returns the crab at the origin with zero heading in the form of a matirx.
  % Each colunm represents one point on the crab.


  %body
  crabPt1 = [ 2 * size; -size; 1];               % top right
  crabPt2 = [ size; size; 1];                    % bottom right
  crabPt3 = [ -2 * size; -size; 1];              % top left
  crabPt4 = [ -size; size; 1];                   % bottom left

  %bottom legs
  crabPt5 = [ 1.25 * size; 0.5 * size; 1];       % top of right leg
  crabPt6 = [ 2* size; 0.5*size; 1];             % middle of right leg
  crabPt7 = [2 * size; 1.5*size; 1];             % end of right leg

  crabPt8 = [-1.25 * size; 0.5 * size; 1];       % top of left leg
  crabPt9 = [ -2 * size; 0.5 * size; 1];         % middele of left leg
  crabPt10 = [ -2 * size; 1.5 * size; 1];        % end of left leg

  %top legs
  crabPt11 = [ 1.75 * size; -0.5 * size; 1];     % top of right leg
  crabPt12 = [ 2.5 * size; 0; 1];                % middle of right leg
  crabPt13 = [ 2.5 * size; size; 1];             % end of right leg

  crabPt14 = [ -1.75 * size; -0.5 * size; 1];    % top of left leg
  crabPt15 = [ -2.5 * size; 0; 1];               % middle of left leg
  crabPt16 = [ -2.5 * size; size; 1];            % end of left leg

  %eyes
  crabPt17 = [ 0.5 * size; -size; 1];            % bottom of right eye
  crabPt18 = [ 0.5 * size; -1.5 * size; 1];      % top of right eye
  crabPt19 = [ -0.5 * size; -size; 1];           % bottom of left eye
  crabPt20 = [ -0.5 * size; -1.5 * size; 1];     % top of left eye


  %center of crabs
  crabPt0 = [ 0; 0; 1];

  crab = [crabPt1, crabPt2, crabPt3, crabPt4, crabPt5, crabPt6, crabPt7, crabPt8, ...
          crabPt9, crabPt10, crabPt11, crabPt12, crabPt13, crabPt14, crabPt15, ...
          crabPt16, crabPt17, crabPt18, crabPt19, crabPt20, crabPt0];

endfunction

