## Copyright (C) 2023 eh552
## Author: eh552 <eh552@KIKAS-LAPTOP>
## Created: 2023-10-27

function [xPeng, yPeng, thetaPeng] = movePeng (x, y, theta, size, height, width)

  moveStep = 100;
  xPeng = x + moveStep;
  yPeng = y;
  thetaPeng = theta;


  % TO BE EDITED TO MAKE THE PENGUIN APPEAR AFTER A CERTAIN AMOUNT OF TIME
  if ( xPeng > width - 10 * size)
    xPeng = size;
    yPeng = rand * height;
  endif


endfunction
