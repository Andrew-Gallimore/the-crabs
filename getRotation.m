## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-09-29

function R = getRotation(theta)
  R = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
endfunction
