function crabGraphics = drawCrab (xCrab,yCrab,thetaCrab,sizeCrab)

  % This function draws the crab by rotating and shifting the crab
  % as it appears in getCrab.m where it is at the origin with zero heading.

  %get crab at the origin
  crab = getCrab(sizeCrab);

  %rotate crab
  R = getRotation(thetaCrab);
  crabRotated = R*crab;

  %shift crab to new location
  S = getTranslation(xCrab,yCrab);
  crab = S*crabRotated;

  %get crab points
  pt1=crab(:,1);
  pt2=crab(:,2);
  pt3=crab(:,3);
  pt4=crab(:,4);
  pt5=crab(:,5);
  pt6=crab(:,6);
  pt7=crab(:,7);
  pt8=crab(:,8);
  pt9=crab(:,9);
  pt10=crab(:,10);
  pt11=crab(:,11);
  pt12=crab(:,12);
  pt13=crab(:,13);
  pt14=crab(:,14);
  pt15=crab(:,15);
  pt16=crab(:,16);
  pt17=crab(:,17);
  pt18=crab(:,18);
  pt19=crab(:,19);
  pt20=crab(:,20);

  %draw the crab body
  crabGraphics(1) = drawLine(pt1,pt2,"r");
  crabGraphics(2) = drawLine(pt2,pt4,"r");
  crabGraphics(3) = drawLine(pt4,pt3,"r");
  crabGraphics(4) = drawLine(pt3,pt1,"r");

  %draw crab eyes
  crabGraphics(5) = drawLine(pt17,pt18,"r");
  crabGraphics(6) = drawLine(pt19,pt20,"r");

  % draw legs
  crabGraphics(7) = drawLine(pt5,pt6,"r"); % bottom right leg
  crabGraphics(8) = drawLine(pt6,pt7,"r");

  crabGraphics(9) = drawLine(pt11,pt12,"r"); % top right leg
  crabGraphics(10) = drawLine(pt12,pt13,"r");

  crabGraphics(11) = drawLine(pt8,pt9,"r"); % bottom left leg
  crabGraphics(12) = drawLine(pt9,pt10,"r");

  crabGraphics(13) = drawLine(pt14,pt15,"r"); % top left leg
  crabGraphics(14) = drawLine(pt15,pt16,"r");


endfunction
