## Author: Andrew
## Created: 2023-12-01

function showLoading()
  looping = 1;
  t0 = clock();

  % Drawing loading screen
  drawBackground("Loading_screen.png");

  % Loop that runs while loading screen is onscreen
  while(looping)
    elapsed_time = etime(clock(), t0);
    if(elapsed_time >= 5)
      looping = 0;
    endif
    pause(0.01);
  endwhile
endfunction
