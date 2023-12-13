## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-10-02

function [xCapt, yCapt, thetaCapt] = moveCapt (x, y, theta, moveForward, rotationDirection, rotationFactor, mapWidth, mapHeight)
  % Variables for movement amounts
  dTheta = pi/6;
  dStep = 50;

  % Setting default values, for if no movement is commanded
  xCapt = x;
  yCapt = y;
  thetaCapt = theta;

  if(moveForward == 1)
    %move captain forward
    xTemp = x + cos(theta)*dStep;
    yTemp = y + sin(theta)*dStep;

    if(isOnMap(xTemp, yTemp, mapWidth, mapHeight, 100))
      xCapt = xTemp;
      yCapt = yTemp;
    endif

  endif

  if(rotationDirection == -1)
    %rotate the captain left
    thetaCapt = theta - dTheta * rotationFactor;
  endif

  if(rotationDirection == 1)
    %rotate the captain right
    thetaCapt = theta + dTheta * rotationFactor;
  endif

  [rows, cols] = size(thetaCapt);
  if(rows > 1)
    thetaCapt = thetaCapt(1);
  endif

endfunction
