## Author: Andrew
## Created: 2023-12-13

function retryLevel = showEndSad()
  looping = 1;
  t0 = clock();

  % Drawing background
  drawBackground("End_screen_sad.png");

  % Loop that runs while background is onscreen
  while(looping)
    % Focusing commandwindow
    commandwindow();

    % Getting input
    cmd = kbhit(1);

    if(cmd == "y" || cmd == "Y")
      retryLevel = 1;
      looping = 0;
    elseif(cmd == "n" || cmd == "N")
      retryLevel = 0;
      looping = 0;
    endif

    pause(0.01);
  endwhile
endfunction
