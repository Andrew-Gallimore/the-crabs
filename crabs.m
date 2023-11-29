function crabs ()
  % Crabs is a kids computer game where a fisherman, called the captain,
  % hunts for a very clever and powerful crab.

  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );

  % Initialize captain location, heading and size
  xCapt = ones(1,2) * 1500;
  yCapt = ones(1,2) * 900;
  thetaCapt = ones(1, 2) * -pi/2;
  sizeCapt = 50;

  rotationFactor = [1; 1];
  rotationDirection = [0; 0];
  moveForward = ["",""];


  % initialize penguin
  xPeng = 1000;
  yPeng = 1000;
  thetaPeng = pi/2;
  sizePeng = 25;

  % Initialize crab
  xCrab = 1000;
  yCrab = 1200;
  thetaCrab = 2*pi;
  sizeCrab = 25;


  % Draw the captain and initialize graphics handles
  for k=1:2
    captGraphics(:,k) = drawCapt(xCapt(k), yCapt(k), thetaCapt(k), sizeCapt);
  endfor
  pengGraphics = drawPeng(xPeng, yPeng, thetaPeng, sizePeng);
  crabGraphics = drawCrab(xCrab, yCrab, thetaCrab, sizeCrab);


  while(1)
    cmd = kbhit(1);
    if(cmd == "Q")
      break
    endif

    % This draws the penguin as it moves across the screen
    % erases penguin
    for p=1:length(pengGraphics)
      delete(pengGraphics(p));
    endfor

    % move Penguin
    [xPeng,yPeng,thetaPeng] = movePeng(xPeng, yPeng, thetaPeng, sizePeng, mapHeight,mapWidth);

    % draws Penguin
    pengGraphics = drawPeng(xPeng,yPeng,thetaPeng,sizePeng);




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



    for k=1:2
       % Custom logic for getting movement/rotation of captain
      [rotationFactor(k), rotationDirection(k), moveForward(k)] = calcMovement(k, cmd, rotationFactor(k), rotationDirection(k));

      %remove current drawn captain
      for(i = 1:length(captGraphics(:,k)))
        delete(captGraphics(i,k));
      endfor

      %Getting new captain position & heading
      [xCapt(k), yCapt(k), thetaCapt(k)] = moveCapt(xCapt(k), yCapt(k), thetaCapt(k), moveForward(k), rotationDirection(k), rotationFactor(k));

      %place new captain
      captGraphics(:,k) = drawCapt(xCapt(k), yCapt(k), thetaCapt(k), sizeCapt);
    endfor


    pause(0.005);

  endwhile
endfunction
