## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-08-25

% Plots and Returns a line handle
% @param  pointA  {Pos vector}
% @param  pointB  {Pos vector}
% @param  color   {Color string}  ex: "r" for red

function lineHandle = drawLine (pointA, pointB, color)
  % formats points for the plot function to like
  x = [pointA(1); pointB(1)];
  y = [pointA(2); pointB(2)];

  % plots and returns the plotted line
  lineHandle = plot(x, y, color);
  set(lineHandle, "LineWidth", 2);

endfunction
