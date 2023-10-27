function crabs ()
  % Crabs is a kids computer game where a fisherman, called the captain,
  % hunts for a very clever and powerful crab.

  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );

  % Initialize captain location, heading and size
  xCapt = 1500;
  yCapt = 900;
  thetaCapt = -pi/2;
  sizeCapt = 50;

  % Draw the captain 1st time
  captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

  % Initial value for smoothing motion
  rotationFactor = 1;
  rotationDirection = 0;



  % Initialize turtle location, heading and size
  xTurt = 1000;
  yTurt = 500;
  thetaTurt = -pi;
  sizeTurt = 50;

  % Drawing turtle 1st time
  turtleGraphics = drawTurtle(xTurt, yTurt, thetaTurt, sizeTurt);




  while(1)
    fflush(stdout);
    cmd = kbhit(1);
    if(cmd == "Q")
      break
    endif


    %remove current turtle grahpics
    for(i = 1:length(turtleGraphics))
      delete(turtleGraphics(i));
    endfor

    %Getting new captain position & heading
    %[xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, cmd, rotationDirection, rotationFactor);

    % Drawing turtle
    turtleGraphics = drawTurtle(xTurt, yTurt, thetaTurt, sizeTurt);





    % Custom logic for rotation, so that its smooth
    if(cmd == "a" || cmd == "d")
      % Setting direction
      if(cmd == "a")
        rotationDirection = -1;
      endif
      if(cmd == "d")
        rotationDirection = 1;
      endif

      % Speeding up his rotation
      if(rotationFactor + 0.3333 < 1)
        rotationFactor = rotationFactor + 0.3333;
      else
        rotationFactor = 1;
      endif
    else
      % Slowing down his rotation
      if(rotationFactor - 0.3333 > 0)
        rotationFactor = rotationFactor - 0.3333;
      else
        rotationFactor = 0;

        % Setting direction
        rotationDirection = 0;
      endif
    endif



    %remove current drawn captain
    for(i = 1:length(captGraphics))
      delete(captGraphics(i));
    endfor

    %Getting new captain position & heading
    [xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, cmd, rotationDirection, rotationFactor);

    %place new captain
    captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

    pause(0.01);

  endwhile
endfunction
