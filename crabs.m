function crabs ()
  % Crabs is a kids computer game where a fisherman, called the captain,
  % hunts for a very clever and powerful crab.

  % Initialize game logic
  gameRunning = 1;
  nextLevel = 0; % Boolean, not number
  retryLevel = 0; % Boolean, not number
  success = 0;
  mapWidth = 2048;
  mapHeight = 1317;

  % Initialize captain
  xCapt = 1500;
  yCapt = 900;
  thetaCapt = -pi/2;
  sizeCapt = 50;
  captHasCrab = 0;

  rotationFactor = [1; 1];
  rotationDirection = [0; 0];
  moveForward = ["",""];


  % initialize penguin
  xPeng = 1000;
  yPeng = 1000;
  thetaPeng = pi/2;
  sizePeng = 25;
  statePeng = 1;

  % initialize boat
  xBoat = 1024;
  yBoat = 150;
  sizeBoat = 150;


  % =================== Showing loading-screen =================== %
  showLoading();



  while(gameRunning)
    % =================== Showing menu =================== %

    if(nextLevel == 1)
      numOfCrabs = numOfCrabs + 1;
    endif
    if(retryLevel == 0 && nextLevel == 0)
      numOfCrabs = showMenu();
    endif


    % =================== Main Game START =================== %

    % Draw the game map and initialize map dimensions.
    drawBackground( "BGImage.png" );

    % Initialize crab(s)
    numCrabsCaught = 0;
    amountOfScreen = 0.75;

    xCrab = rand(1, numOfCrabs) * mapWidth;
    yCrab = rand(1, numOfCrabs) * mapHeight*(1 - amountOfScreen) + (mapHeight * amountOfScreen);
    thetaCrab = (rand(1,numOfCrabs) - 0.5) * pi/2;
    LRCrab = round(rand(1, numOfCrabs));
    stateCrab = ones(1, numOfCrabs);
    sizeCrab = 25;

    % Draw the captain and initialize graphics handles
    [captGraphics, netX, netY] = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);
    for c=1:numOfCrabs
      crabGraphics(:, c) = drawCrab(xCrab(c), yCrab(c), thetaCrab(c), sizeCrab);
    endfor
    pengGraphics = drawPeng(xPeng, yPeng, thetaPeng, sizePeng)

    boatGraphics = drawBoat (xBoat, yBoat, sizeBoat);

    % Focusing commandwindow
    commandwindow();

    % Resetting number of crabs
    numCrabsCaught = 0;
    success = 0;

    % =================== Main Game LOOP =================== %
    while(1)

      cmd = kbhit(1);
      if(cmd == "Q")
        break
      endif

      if(numCrabsCaught >= numOfCrabs)
        success = 1;
        break;
      endif

      % Focusing commandwindow
      commandwindow();


     % This draws the penguin as it moves across the screen
     % erases penguin
        for p=1:length(pengGraphics)
          delete(pengGraphics(p));
        endfor

     % move Penguin
      [xPeng,yPeng,thetaPeng] = movePeng(xPeng, yPeng, thetaPeng, sizePeng, mapHeight,mapWidth);

     % draws Penguin
      pengGraphics = drawPeng(xPeng,yPeng,thetaPeng,sizePeng);



      % If captain is at top
      if(netY < 200 && captHasCrab == 1)
        for c=1:numOfCrabs
          if(stateCrab(c) == 2)
            % Putting crab into gone state
            stateCrab(c) = 3;

            % Erase the caught crab
            for i=1:length(crabGraphics)
              delete(crabGraphics(i, c));
            endfor

            numCrabsCaught = numCrabsCaught + 1;
          endif
        endfor

        captHasCrab = 0;
      endif

      % Custom logic for getting movement/rotation of captain
      [rotationFactor, rotationDirection, moveForward] = calcMovement(cmd, rotationFactor, rotationDirection);

      % Remove current drawn captain
      for(i = 1:length(captGraphics))
        delete(captGraphics(i));
      endfor

      % Getting new captain position & heading
      [xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, moveForward, rotationDirection, rotationFactor, mapWidth, mapHeight);

      % Place new captain
      [captGraphics, netX, netY] = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);



      % Main loop for all the crabs
      for c=1:numOfCrabs
        if(stateCrab(c) == 1 || stateCrab(c) == 2)
          % Checking if the crab is caught
          if(captHasCrab == 0)
            if(distance(xCapt, yCapt, xCrab(c), yCrab(c)) < 180)
              stateCrab(c) = 2;
              captHasCrab = 1;
            endif
          endif

          % Erase old crab
          for i=1:length(crabGraphics)
            delete(crabGraphics(i, c));
          endfor

          if(stateCrab(c) == 1)
            % Move crab(s) left and right
            limitedHight = mapHeight*(1 - amountOfScreen);
            [xCrab(c),yCrab(c),thetaCrab(c), LRCrab(c)] = moveCrab(LRCrab(c),xCrab(c),yCrab(c),thetaCrab(c), limitedHight, mapHeight, mapWidth, sizeCrab);
          elseif(stateCrab(c) == 2)
            % Put crab at tip of net
            xCrab(c) = netX;
            yCrab(c) = netY;
            thetaCrab(c) = thetaCapt + (rand() * pi/4) - pi/2;
          endif

          % Draw new crab(s)
          crabGraphics(:, c) = drawCrab(xCrab(c), yCrab(c), thetaCrab(c), sizeCrab);
        endif
      endfor

      pause(0.005);

    endwhile

    % =================== Showing endscreen =================== %

    nextLevel = 0;
    if(success == 1)
        nextLevel = showEndSuccess();
    else
        retryLevel = showEndSad();
    endif

  endwhile
endfunction
