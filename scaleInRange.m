## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-09-01

%It 'maps' a number (given a specific range) into another number within another range
% @param  val     {number}        The value your are 'maping'
% @param  inMax   {number}        Upper range of input value
% @param  inMin   {number}        Lower range of input value
% @param  outMax  {number}        Upper range of output value
% @param  outMin  {number}        Lower range of output value

%NOTE: It doesn't seam to work with negative values for Mins/Maxs

function endValue = scaleInRange (val, inMax, inMin, outMax, outMin)
  top = -val +inMax;
  bottom = inMax - inMin;

  scaler = outMax - outMin;

  endValue = outMax - top / bottom * scaler + outMin;

endfunction
