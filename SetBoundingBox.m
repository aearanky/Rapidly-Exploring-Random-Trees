function BCflag = SetBoundingBox(xp,yp,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9)

Bounds= [xp-15 xp+15 xp+15 xp-15;...
         yp-15 yp-15 yp+15 yp+15];
     
P1 = [X1;Y1];
P2 = [X2;Y2];
P3 = [X3;Y3];
P4 = [X4;Y4];
P5 = [X5;Y5];
P6 = [X6;Y6];
P7 = [X7;Y7];
P8 = [X8;Y8];
P9 = [X9;Y9];

Int1 = poly2poly(Bounds,P1);
Int2 = poly2poly(Bounds,P2);
Int3 = poly2poly(Bounds,P3);
Int4 = poly2poly(Bounds,P4);
Int5 = poly2poly(Bounds,P5);
Int6 = poly2poly(Bounds,P6);
Int7 = poly2poly(Bounds,P7);
Int8 = poly2poly(Bounds,P8);
Int9 = poly2poly(Bounds,P9);

BCflag = 0;

if ~isempty(Int1)||~isempty(Int2)||~isempty(Int3)||~isempty(Int4)...
   ||~isempty(Int5)||~isempty(Int6)||~isempty(Int7)||~isempty(Int8)||...
   ~isempty(Int9)
    BCflag =1;
end
end