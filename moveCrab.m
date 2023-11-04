
## Author: eh552 <eh552@KIKAS-LAPTOP>
## Created: 2023-10-13

function [xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,height,width,size)

dStep = 50;
dTheta = 20;


% TO BE EDITED TO MAKE THE CRAB MOVE BACK AND FORTH ACROSS THE SCREEN
%move left
  if (cmd == "j")
    xCrab = x + sin(theta) * dStep;
    yCrab = y - cos(theta) * dStep;
    thetaCrab = theta;

%move right
  elseif (cmd == "l")
    xCrab = x - sin(theta) *dStep;
    yCrab = y + cos(theta) *dStep;
    thetaCrab = theta;

%move back
  elseif (cmd == "k")
    xCrab = x - cos(theta) *dStep;
    yCrab = y - sin(theta) * dStep;
    thetaCrab = theta;

%rotate right
  elseif (cmd == "i")
    xCrab = x;
    yCrab = y;
    thetaCrab = theta + dTheta;

%rotate left
  elseif (cmd == ",")
    xCrab = x;
    yCrab = y;
    thetaCrab = theta - dTheta;

  else
    xCrab = x;
    yCrab = y;
    thetaCrab = theta;

  endif

endfunction
