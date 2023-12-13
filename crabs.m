function crabs ()
  % Crabs is a kids computer game where a fisherman, called the captain,
  % hunts for a very clever and powerful crab.

  % Initialize game logic
  gameRunning = 1;
  mapWidth = 2048;
  mapHeight = 1317;

  % Initialize captain
  xCapt = 1500;
  yCapt = 900;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  captSpeed = 50;

  rotationFactor = [1; 1];
  rotationDirection = [0; 0];
  moveForward = ["",""];


  % initialize penguin
  xPeng = 1000;
  yPeng = 1000;
  thetaPeng = pi/2;
  sizePeng = 25;

  % initialize boat
  xBoat = 1024;
  yBoat = 150;
  sizeBoat = 150;


  % Initialize crab(s)
  numOfCrabs = 2;
  amountOfScreen = 0.75;

  xCrab = rand(1, numOfCrabs) * mapWidth;
  yCrab = rand(1, numOfCrabs) * mapHeight*(1 - amountOfScreen) + (mapHeight * amountOfScreen);
  thetaCrab = (rand(1,numOfCrabs) - 0.5) * pi/2;
  LRCrab = round(rand(1, numOfCrabs));
  stateCrab = ones(1, numOfCrabs);
  sizeCrab = 25;

  % =================== Showing loading-screen =================== %
  showLoading();



  while(gameRunning)
    % =================== Showing menu =================== %
    showMenu();


    % =================== Main Game START =================== %

    % Draw the game map and initialize map dimensions.
    drawBackground( "BGImage.png" );

    % Draw the captain and initialize graphics handles
    captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);
    for c=1:numOfCrabs
      crabGraphics(:, c) = drawCrab(xCrab(c), yCrab(c), thetaCrab(c), sizeCrab);
    endfor
    pengGraphics = drawPeng(xPeng, yPeng, thetaPeng, sizePeng);

    % Focusing commandwindow
    commandwindow();


    % =================== Main Game LOOP =================== %
    while(1)

      cmd = kbhit(1);
      if(cmd == "Q")
        break
      endif

      boatGraphics = drawBoat (xBoat, yBoat, sizeBoat);

     % This draws the penguin as it moves across the screen
     % erases penguin
        for p=1:length(pengGraphics)
          delete(pengGraphics(p));
        endfor

     % move Penguin
      [xPeng,yPeng,thetaPeng] = movePeng(xPeng, yPeng, thetaPeng, sizePeng, mapHeight,mapWidth);

     % draws Penguin
      pengGraphics = drawPeng(xPeng,yPeng,thetaPeng,sizePeng);


      for c=1:numOfCrabs
        if(stateCrab(c) == 1 || stateCrab(c) == 2)
          %erase old crab
          for i=1:length(crabGraphics)
            delete(crabGraphics(i, c));
          endfor

          if(stateCrab(c) == 1)
            % Move crab(s) left and right
            limitedHight = mapHeight*(1 - amountOfScreen);
            [xCrab(c),yCrab(c),thetaCrab(c), LRCrab(c)] = moveCrab(LRCrab(c),xCrab(c),yCrab(c),thetaCrab(c), limitedHight, mapHeight, mapWidth);
          elseif(stateCrab(c) == 2)
            % Put crab at tip of net
            % TODO: put crab at tip of net
          endif

          %draw new crab(s)
          crabGraphics(:, c) = drawCrab(xCrab(c), yCrab(c), thetaCrab(c), sizeCrab);
        endif
      endfor


      % Custom logic for getting movement/rotation of captain
      [rotationFactor, rotationDirection, moveForward] = calcMovement(cmd, rotationFactor, rotationDirection);

      %remove current drawn captain
      for(i = 1:length(captGraphics))
        delete(captGraphics(i));
      endfor

      %Getting new captain position & heading
      [xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, moveForward, rotationDirection, rotationFactor, captSpeed);

      %place new captain
      captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);


      pause(0.005);

    endwhile

    % =================== Showing endscreen =================== %

  endwhile
endfunction
