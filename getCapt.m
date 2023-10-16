## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-08-30

%It gives the points of the captain, based in-part on the arguements
% @param    captSize    {number}            The overall scaler of the captain
% @param    leftSpear   {boolean}           Whether or not to display the left spear
% @param    rightSpear  {boolean}           Whether or not to display the right spear
% @param    jab         {number [0-100]}   The amount (0-100) of jab the caracter should pose in
% @requires scaleInRange.m

function capt = getCapt (captSize, leftSpear, rightSpear, jab)
  %config variables for captain
  legMult = 3;
  armLength = captSize*1.5;
  spearMult = 5;
  jabLengthLong = 2;



  %Setting up jabValues
  jabSMultiplier = scaleInRange(jab, 0, 100, 0, jabLengthLong) - 2;
  jabSValue = jabSMultiplier * captSize;

  jabEMultiplier = scaleInRange(jab, 0, 100, 0, jabLengthLong)/2 - 1;
  jabEValue = jabEMultiplier * captSize;



  %LEFT
  lSholder = [captSize; captSize; 1];                        %left sholder
  lHip = [-captSize; captSize; 1];                           %left hip
  lFoot = [-captSize * legMult; captSize; 1];                %left foot

  lElbo = [0 + jabEValue; captSize + 0.5*armLength; 1];      %left hand
  lHand = [0 + jabSValue; captSize + armLength; 1];          %left hand

  %RIGHT
  rSholder = [captSize; -captSize; 1];                       %right sholder
  rHip = [-captSize; -captSize; 1];                          %right hip
  rFoot = [-captSize * legMult; -captSize; 1];               %right foot

  rElbo = [0 + jabEValue; -captSize - 0.5*armLength; 1];     %left hand
  rHand = [0 + jabSValue; -captSize - armLength; 1];         %right hand

  %HEAD
  lNeck = [captSize; captSize/2; 1];                         %left neck
  lHead = [2*captSize; captSize/2; 1];                       %left head
  rNeck = [captSize; -captSize/2; 1];                        %right neck
  rHead = [2*captSize; -captSize/2; 1];                      %right head



  %Combining points that form captain as a matrix_type
  capt = [lSholder, lHip, lFoot, lElbo, lHand, rSholder, rHip, rFoot, rElbo, rHand, lNeck, lHead, rNeck, rHead];



  %Appending the speers if they are there
  if(leftSpear)
    #SPEAR
    tSpear = [captSize * spearMult * 0.66 + jabSValue; captSize + armLength; 1];
    bSpear = [-captSize * spearMult * 0.33 + jabSValue; captSize + armLength; 1];

    capt = [capt [tSpear, bSpear]];
  endif
  if(rightSpear)
    #SPEAR
    tSpear = [captSize * spearMult * 0.66 + jabSValue; -captSize - armLength; 1];
    bSpear = [-captSize * spearMult * 0.33 + jabSValue; -captSize - armLength; 1];

    capt = [capt [tSpear, bSpear]];
  endif

endfunction
