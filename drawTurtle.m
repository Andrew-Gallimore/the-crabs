## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-10-25

function turtleGraphics = drawTurtle (xTurt, yTurt, thetaTurt, sizeTurt)
  turtle = getTurtle(sizeTurt);
  color = "g";

   % Get & apply the rotation matrix for Turtle
  R = getRotation(thetaTurt);
  rotatedTurtle = R*turtle;

  % Get & apply translation matrix for Turtle
  T = getTranslation(xTurt, yTurt);
  turtle = T*rotatedTurtle;

  pt1=turtle( : , 1);
  pt2=turtle( : , 2);
  pt3=turtle( : , 3);
  pt4=turtle( : , 4);
  pt5=turtle( : , 5);
  pt6=turtle( : , 6);
  pt7=turtle( : , 7);
  pt8=turtle( : , 8);
  pt9=turtle( : , 9);
  pt10=turtle( : , 10);
  pt11=turtle( : , 11);
  pt12=turtle( : , 12);
  pt13=turtle( : , 13);
  pt14=turtle( : , 14);
  pt15=turtle( : , 15);
  pt16=turtle( : , 16);
  pt17=turtle( : , 17);
  pt18=turtle( : , 18);

  % Body Points
  turtleGraphics(1) = drawLine(pt1 , pt2 , color);
  turtleGraphics(2) = drawLine(pt2 , pt3 , color);
  turtleGraphics(3) = drawLine(pt3 , pt4 , color);
  turtleGraphics(4) = drawLine(pt4 , pt5 , color);
  turtleGraphics(4) = drawLine(pt5 , pt6 , color);
  turtleGraphics(5) = drawLine(pt6 , pt7 , color);
  turtleGraphics(6) = drawLine(pt7 , pt8 , color);
  turtleGraphics(7) = drawLine(pt8 , pt1 , color);

  % Feet
  turtleGraphics(8) = drawLine(pt9 , pt10 , color);
  turtleGraphics(9) = drawLine(pt11 , pt12 , color);
  turtleGraphics(10) = drawLine(pt13 , pt14 , color);
  turtleGraphics(11) = drawLine(pt15 , pt16 , color);

  % Head
  turtleGraphics(12) = drawLine(pt2 , pt17 , color);
  turtleGraphics(13) = drawLine(pt17 , pt18 , color);
  turtleGraphics(14) = drawLine(pt18 , pt3 , color);
endfunction
