function map = mapUpdate(map, f, l01, l04, r12, r15, o, p, c, t)

%  VALORI DELLA VARIABILE cellState
%   0   =   Cella non valutata;
%   1   =   Cella valutata LIBERA;
%   2   =   Cella VISITATA;
%   3   =   Cella valutata OCCUPATA;

%%% CELLA AVANTI %%%
if ((f > (c + t) || isnan(f)) && ((l01 > (0.4/(2*(sin(pi/8)))))||isnan(l01)) && ((r15 > (0.4/(2*(sin(pi/8))))||isnan(r15))))
    cellState = 1;
else
    cellState = 3;
end
cellposition = p;
switch o
    case 0
        cellposition = [p(1) p(2) + 1];
    case 90
        cellposition = [p(1) - 1 p(2)];
    case 180
        cellposition = [p(1) p(2) - 1];
    case 270
        cellposition = [p(1) + 1 p(2)];
end
if (map(cellposition(1), cellposition(2)) ~= 2) && (map(cellposition(1), cellposition(2)) ~= 3)
    map(cellposition(1), cellposition(2)) = cellState;
end

%%% CELLA A SINISTRA %%%
if l04 > (c + t ) || isnan(l04)
    cellState = 1;
else
    cellState = 3;
end
cellposition = p;
switch o
    case 0
        cellposition = [p(1) - 1 p(2)];
    case 90
        cellposition = [p(1) p(2) - 1];
    case 180
        cellposition = [p(1) + 1 p(2)];
    case 270
        cellposition = [p(1) p(2) + 1];
end
if (map(cellposition(1), cellposition(2)) ~= 2) && (map(cellposition(1), cellposition(2)) ~= 3)
    map(cellposition(1), cellposition(2)) = cellState;
end

%%% CELLA A DESTRA %%%
if r12 > (c + t ) || isnan(r12)
    cellState = 1;
else
    cellState = 3;
end
cellposition = p;
switch o
    case 0
        cellposition = [p(1) + 1 p(2)];
    case 90
        cellposition = [p(1) p(2) + 1];
    case 180
        cellposition = [p(1) - 1 p(2)];
    case 270
        cellposition = [p(1) p(2) - 1];
end
if (map(cellposition(1), cellposition(2)) ~= 2) && (map(cellposition(1), cellposition(2)) ~= 3)
    map(cellposition(1), cellposition(2)) = cellState;
end
end
