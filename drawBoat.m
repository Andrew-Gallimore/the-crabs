## Author: eh552 <eh552@KIKAS-LAPTOP>
## Created: 2023-12-11

function B = drawBoat (xBoat, yBoat, sizeBoat)

    boat = getBoat(sizeBoat);

    T = getTranslation(xBoat, yBoat);
    boat = T * boat;

    b1 = boat (:, 1);
    b2 = boat (:, 2);
    b3 = boat (:, 3);
    b4 = boat (:, 4);

    B(1) = drawLine(b1, b2, "k");
    B(2) = drawLine(b2, b4, "k");
    B(3) = drawLine(b4, b3, "k");

endfunction
