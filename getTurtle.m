## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-10-18

function turtle = getTurtle (size)
  % Body points of the turtle
  b1 = [size * 1.5; size; 1];
  b2 = [size * 0.5; size * 2; 1];
  b3 = [-size * 0.5; size * 2; 1];
  b4 = [-size * 1.5; size; 1];
  b5 = [-size * 1.5; -size; 1];
  b6 = [-size * 0.5; -size * 2; 1];
  b7 = [size * 0.5; -size * 2; 1];
  b8 = [size * 1.5; -size; 1];

  % Legs
  L1 = [-size * 1; size * 1.5; 1];
  F1 = [-size * 2; size * 2.5; 1];

  L2 = [size * 1; size * 1.5; 1];
  F2 = [size * 2; size * 2.5; 1];

  L3 = [size * 1; -size * 1.5; 1];
  F3= [size * 2; -size * 2.5; 1];

  L4 = [-size * 1; -size * 1.5; 1];
  F4 = [-size * 2; -size * 2.5; 1];

  % Head
  h1 = [size * 0.5; size * 3; 1];
  h2 = [-size * 0.5; size * 3; 1];

  % Building the return variable
  turtle = [b1, b2, b3, b4, b5, b6, b7, b8, L1, F1, L2, F2, L3, F3, L4, F4, h1, h2];



endfunction
