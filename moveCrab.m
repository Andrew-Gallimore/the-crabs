## Authors: Erika, Andrew
## Created: 2023-10-13

function [xCrab,yCrab,thetaCrab,newDirection] = moveCrab(direction,x,y,theta,height,width,size)

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

  if(isOnMap(xTemp, yTemp, width, height, size))
    % Apply the movement
    xCrab = xTemp;
    yCrab = yTemp;
  else
    % Flip direction, and don't move at all
    newDirection = 1 - direction;
  endif

  % TODO: Add rotation logic, and boundary logic so they rotate/bounce of the smaller boundary at bottom of screen

  ##% ROTATIONS
  ##if(cmd == "u")
  ##  %rotate the captain left
  ##  thetaCrab = theta - dTheta;
  ##elseif(cmd == "o")
  ##  %rotate the captain right
  ##  thetaCrab = theta + dTheta;
  ##endif

endfunction
