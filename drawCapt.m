## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-09-01

% Gets, transforms, plots, and Returns the full captain
% @param  xCapt     {number}
% @param  yCapt     {number}
% @param  thetaCapt {number}
% @param  sizeCapt  {number}

function captainGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt)
  capt = getCapt(sizeCapt, true, false, 0);

  % Get & apply the rotation matrix for Captain
  R = getRotation(thetaCapt);
  rotatedCaptain = R*capt;

  % Get & apply translation matrix for Captain
  T = getTranslation(xCapt, yCapt);
  capt = T*rotatedCaptain;

  [rows, columns] = size(capt);

  % Extracting points
  pt1=capt( : , 1);
  pt2=capt( : , 2);
  pt3=capt( : , 3);
  pt4=capt( : , 4);
  pt5=capt( : , 5);
  pt6=capt( : , 6);
  pt7=capt( : , 7);
  pt8=capt( : , 8);
  pt9=capt( : , 9);
  pt10=capt( : , 10);
  pt11=capt( : , 11);
  pt12=capt( : , 12);
  pt13=capt( : , 13);
  pt14=capt( : , 14);
  pt15=capt( : , 15);
  pt16=capt( : , 16);
  pt17=capt( : , 17);
  pt18=capt( : , 18);
  pt19=capt( : , 19); % middle of net
  pt20=capt( : , 20);
  pt21=capt( : , 21);

  % Draw the captain and set the return vector of graphics handles.
  captainGraphics(1) = drawLine(pt1 , pt2 , "k"); %l sholder hip
  captainGraphics(2) = drawLine(pt2 , pt3 , "k"); %l hip foot
  captainGraphics(3) = drawLine(pt1 , pt4 , "k"); %l arm elbo
  captainGraphics(4) = drawLine(pt4 , pt5 , "k"); %l elbo hand
  captainGraphics(5) = drawLine(pt6 , pt7 , "k"); %r sholder hip
  captainGraphics(6) = drawLine(pt7 , pt8 , "k"); %r hip foot
  captainGraphics(7) = drawLine(pt6 , pt9 , "k"); %r arm elbo
  captainGraphics(8) = drawLine(pt9 , pt10, "k"); %r elbo hand
  captainGraphics(9) = drawLine(pt2 , pt7 , "k"); %hip hip
  captainGraphics(10) = drawLine(pt1 , pt6 , "k"); %sholder sholder
  captainGraphics(11) = drawLine(pt11 , pt12 , "k"); %l head
  captainGraphics(12) = drawLine(pt13 , pt14 , "k"); %r head
  captainGraphics(13) = drawLine(pt12 , pt14 , "k"); %head top

  captainGraphics(14) = drawLine(pt15, pt16, "k");
  captainGraphics(15) = drawLine(pt16, pt17, "k");
  captainGraphics(16) = drawLine(pt17, pt18, "k");
  captainGraphics(17) = drawLine(pt21, pt20, "k");
  captainGraphics(18) = drawLine(pt20, pt15, "k");
  captainGraphics(19) = drawLine(pt20, pt18, "k");



%  if(columns >= 16)
%    pt15=capt( : , 15);
%    pt16=capt( : , 16);
%    captainGraphics(14) = drawLine(pt15 , pt16 , "k"); %spear
%  endif

%  if(columns == 18)
%    pt17=capt( : , 17);
%    pt18=capt( : , 18);
%    captainGraphics(15) = drawLine(pt17 , pt18 , "k"); %spear 2
%  endif

endfunction
