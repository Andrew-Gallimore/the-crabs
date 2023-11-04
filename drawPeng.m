## Copyright (C) 2023 eh552
##
## Author: eh552 <eh552@KIKAS-LAPTOP>
## Created: 2023-10-24

function P = drawPeng (xPeng, yPeng, thetaPeng, sizePeng)

  % get penguin
  penguin = getPeng(sizePeng);

  % shift translation of penguin

  T = getTranslation(xPeng,yPeng);
  penguin = T * penguin;

  %------------------------%


  % get penguin points
  pt1 = penguin(:, 1);
  pt2 = penguin(:, 2);
  pt3 = penguin(:, 3);
  pt4 = penguin(:, 4);
  pt5 = penguin(:, 5);
  pt6 = penguin(:, 6);
  pt7 = penguin(:, 7);
  pt8 = penguin(:, 8);
  pt9 = penguin(:, 9);
  pt10 = penguin(:, 10);
  pt11 = penguin(:, 11);
  pt12 = penguin(:, 12);
  pt13 = penguin(:, 13);
  pt14 = penguin(:, 14);
  pt15 = penguin(:, 15);
  pt16 = penguin(:, 16);
  pt17 = penguin(:, 17);
  pt18 = penguin(:, 18);
  pt19 = penguin(:, 19);
  pt20 = penguin(:, 20);
  pt21 = penguin(:, 21);
  pt22 = penguin(:, 22);
  pt23 = penguin(:, 23);



  % draw penguin head
  P(1) = drawLine(pt1, pt2, "b");
  P(2) = drawLine(pt2, pt10, "b");
  P(3) = drawLine(pt10, pt9, "b");
  P(4) = drawLine(pt9, pt1, "b");

  % draw penguin torso
  P(5) = drawLine(pt2, pt3, "b");
  P(6) = drawLine(pt3, pt11, "b");
  P(7) = drawLine(pt11, pt10, "b");

  % draw left leg
  P(8) = drawLine(pt4, pt5, "b");
  P(9) = drawLine(pt5, pt6, "b");

  % draw right leg
  P(10) = drawLine(pt12, pt13, "b");
  P(11) = drawLine(pt13, pt14, "b");

  % draw left arm
  P(12) = drawLine(pt7, pt8, "b");
  P(13) = drawLine(pt15, pt16, "b");

  % draw beak
  P(14) = drawLine(pt17, pt18, "y");
  P(15) = drawLine(pt18, pt19, "y");
  P(16) = drawLine(pt19, pt17, "y");

  % draw eyes
  P(17) = drawLine(pt20, pt21, "k");
  P(18) = drawLine(pt22, pt23, "k");


  endfunction
