## Author: Andrew
## Created: 2023-12-01

function level = showMenu()
  looping = 1;
  t0 = clock();

  % Drawing menu screen
  drawBackground("Home_screen.png");

  % Loop that runs while menu screen is onscreen
  while(looping)
    % Focusing commandwindow
    commandwindow();

    % Getting input
    cmd = kbhit(1);

    if(cmd == "1" || cmd == "2" || cmd == "3" || cmd == "4" || cmd == "5" || cmd == "6" || cmd == "7" || cmd == "8" || cmd == "9")
      level = str2num(cmd);
      looping = 0;
    endif

    pause(0.01);
  endwhile
endfunction
