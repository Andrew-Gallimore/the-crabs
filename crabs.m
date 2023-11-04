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

  % initialize penguin
  xPeng = 1000;
  yPeng = 1000;
  thetaPeng = pi/2;
  sizePeng = 25;

  % Initialize crab location, heading and size
  xCrab = 1000;
  yCrab = 1200;
  thetaCrab = 2*pi;
  sizeCrab = 25;

  % Draw the captain and initialize graphics handles
  captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);
  pengGraphics = drawPeng(xPeng, yPeng, thetaPeng, sizePeng);
  crabGraphics = drawCrab(xCrab, yCrab, thetaCrab, sizeCrab);

  % Initial value for smoothing motion
  rotationFactor = 1;
  rotationDirection = 0;

  while(1)



    % THis draws the penguin as it moves across the screen
    % erases penguin
    for p=1:length(pengGraphics)
      delete(pengGraphics(p));
    endfor

     %move Penguin
    [xPeng,yPeng,thetaPeng] = movePeng(xPeng, yPeng, thetaPeng, sizePeng, mapHeight,mapWidth);

    % draws Penguin
    pengGraphics = drawPeng(xPeng,yPeng,thetaPeng,sizePeng);


    cmd = kbhit(1);
    if(cmd == "Q")
      break
    endif

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


    % THIS MAKE THE CRAB MOVE ------- TO BE EDITED ---------
    if (cmd == "i" || cmd == "j" || cmd == "k" || cmd == "l" || cmd ==",") % respond crab moved
      %erase old crab
      for i=1:length(crabGraphics)
      delete(crabGraphics(i));
      endfor

      %move crab
      [xCrab,yCrab,thetaCrab] = moveCrab(cmd,xCrab,yCrab,thetaCrab,sizeCrab, mapHeight, mapWidth);

      %draw new crab
      crabGraphics = drawCrab(xCrab,yCrab,thetaCrab,sizeCrab);
     endif



    %remove current drawn captain
    for(i = 1:length(captGraphics))
      set(captGraphics(i), 'visible', 'off');
    endfor

    %Getting new captain position & heading
    [xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, cmd, rotationDirection, rotationFactor);

    %place new captain
    captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);


    pause(0.005);

  endwhile
endfunction
