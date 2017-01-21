function CCflag = CheckCollision(x1,y1,x2,y2,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9)
% L1 = [3 4;3 4]
% P1 = [0 2 2 0;0 0 2 2]
CCflag=0;

L1 = [x1 x2;y1 y2];
P1 = [X1;Y1];
P2 = [X2;Y2];
P3 = [X3;Y3];
P4 = [X4;Y4];
P5 = [X5;Y5];
P6 = [X6;Y6];
P7 = [X7;Y7];
P8 = [X8;Y8];
P9 = [X9;Y9];

Int1 = poly2poly(L1,P1);
Int2 = poly2poly(L1,P2);
Int3 = poly2poly(L1,P3);
Int4 = poly2poly(L1,P4);
Int5 = poly2poly(L1,P5);
Int6 = poly2poly(L1,P6);
Int7 = poly2poly(L1,P7);
Int8 = poly2poly(L1,P8);
Int9 = poly2poly(L1,P9);

if ~isempty(Int1)||~isempty(Int2)||~isempty(Int3)||~isempty(Int4)...
   ||~isempty(Int5)||~isempty(Int6)||~isempty(Int7)||~isempty(Int8)||...
   ~isempty(Int9)
    CCflag =1;
end
end