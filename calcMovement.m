## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-11-03

function [rotationFactor, rotationDirection, moveForward] = calcMovement(playerIndex, cmd, rFactor, rDirection)

  % Changing the inputs it looks for depeding on playerIndex supplied
  if(playerIndex == 1)
    Forward = "w";
    Left = "a";
    Right = "d";
  elseif(playerIndex == 2)
    Forward = "i";
    Left = "j";
    Right = "l";
  endif

  % ROTATION LOGIC
  if(cmd == Left || cmd == Right)
    % Setting direction
    if(cmd == Left)
      rotationDirection = -1;
    elseif(cmd == Right)
      rotationDirection = 1;
    endif

    % Speeding up their rotation
    if(rFactor + 0.3333 < 1)
      rotationFactor = rFactor + 0.3333;
    else
      rotationFactor = 1;
    endif
  else
    % Slowing down their rotation
    if(rFactor - 0.3333 > 0)
      rotationFactor = rFactor - 0.3333;

      %Keeping the direction going until the factor is zero
      rotationDirection = rDirection;
    else
      rotationFactor = 0;

      % Setting direction
      rotationDirection = 0;
    endif
  endif

  % MOVEMENT LOGIC
  if(cmd == Forward)
    moveForward = 1;
  else
    moveForward = 0;
  endif
endfunction
