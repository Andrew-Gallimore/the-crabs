## Authors: Erika, Andrew
## Created: 2023-10-13

function [xCrab,yCrab,thetaCrab,newDirection] = moveCrab(direction, x, y, theta, limitedHeight, height, width, size)

  % Movement/Rotation Amounts
  dStep = 50;
  dTheta = 20;

  % Setting default values, for if no movement is commanded
  xCrab = x;
  yCrab = y;
  thetaCrab = theta;
  newDirection = direction;

  if(direction == 0)
    %move crab left
    xTemp = x + -cos(theta)*dStep;
    yTemp = y + -sin(theta)*dStep;
  elseif(direction == 1)
    %move crab right
    xTemp = x + cos(theta)*dStep;
    yTemp= y + sin(theta)*dStep;
  endif

  % Check if its hitting any edge, add new theta
  if(isOnMap(xTemp, height - yTemp, width, limitedHeight, size))
    % Apply the movement
    xCrab = xTemp;
    yCrab = yTemp;
  else
    if(theta < 0)
      thetaCrab = rand() * pi/4;
    else
      thetaCrab = (rand() - 1) * pi/4;
    endif
  endif

  % Check if its hitting side, change direction
  if(isOnMap(xTemp, limitedHeight/2, width, limitedHeight, size))
    %DO NOTHING HERE, already handled above
  else
    % Flip direction, and don't move at all
    newDirection = 1 - direction;
  endif

endfunction
