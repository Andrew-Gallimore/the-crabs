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

  % Draw the captain
  for k=1:2
    captGraphics(:,k) = drawCapt(xCapt(k), yCapt(k), thetaCapt(k), sizeCapt);
  endfor



  % Initialize penguin
  xPeng = 1000;
  yPeng = 1000;
  thetaPeng = pi/2;
  sizePeng = 25;
  % Draw the penguin
  pengGraphics = drawPeng(xPeng, yPeng, thetaPeng, sizePeng);



  % Initialize turtle location, heading and size
  xTurt = 1000;
  yTurt = 500;
  thetaTurt = -pi;
  sizeTurt = 35;
  % Drawing the turtle
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




    %remove current penguin grahpics
    for(i = 1:length(pengGraphics))
      delete(pengGraphics(i));
    endfor

    %Getting new penguin position & heading
    %[xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, cmd, rotationDirection, rotationFactor);

    % Drawing penguin
    pengGraphics = drawPeng(xPeng, yPeng, thetaPeng, sizePeng);




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
