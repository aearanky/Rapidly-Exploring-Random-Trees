function FreeToGo = CheckObstacle(xp,yp,xNext,yNext,Configuration,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9)
FreeToGo=0;
if Configuration==1
    Xp=[xp-5 xp+5 xp+5 xp-5];
    Yp=[yp-15 yp-15 yp+15 yp+15];

    Xn=[xNext-5 xNext+5 xNext+5 xNext-5];
    Yn=[yNext-15 yNext-15 yNext+15 yNext+15];

    P=[Xn;Yn];
    ObsCollisionFlag = CheckObjectCollision(P,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
    if ObsCollisionFlag==0 %No Object Collision
        LineFlag(4)=0;
        for i=1:4
            LineFlag(i) = CheckCollision(Xp(i),Yp(i),Xn(i),Yn(i),X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
        end
        if (LineFlag(1)&&LineFlag(2)&&LineFlag(3)&&LineFlag(4))==0%No Line Collision
            FreeToGo = 1;
        else
            FreeToGo = 0;
        end
    end
    
    %Configuration2
else if Configuration==2
    Xp=[xp-15 xp+15 xp+15 xp-15];
    Yp=[yp-5 yp-5 yp+5 yp+5];

    Xn=[xNext-15 xNext+15 xNext+15 xNext-15];
    Yn=[yNext-5 yNext-5 yNext+5 yNext+5];        
    P=[Xn;Yn];
    ObsCollisionFlag = CheckObjectCollision(P,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
    
    if ObsCollisionFlag==0 %No Object Collision
        LineFlag(4)=0;
        for i=1:4
            P = [Xp(i) Xn(i);Yp(i) Yn(i)];
            LineFlag(i) = CheckObjectCollision(P,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
        end
        if (LineFlag(1)&&LineFlag(2)&&LineFlag(3)&&LineFlag(4))==0%No Line Collision
            FreeToGo = 1;
         else
            FreeToGo = 0;
        end                         
    end
    end
end
end

function CCflag = CheckObjectCollision(P,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9)
    
CCflag=0;
P1 = [X1;Y1];
P2 = [X2;Y2];
P3 = [X3;Y3];
P4 = [X4;Y4];
P5 = [X5;Y5];
P6 = [X6;Y6];
P7 = [X7;Y7];
P8 = [X8;Y8];
P9 = [X9;Y9];

Int1 = poly2poly(P,P1);
Int2 = poly2poly(P,P2);
Int3 = poly2poly(P,P3);
Int4 = poly2poly(P,P4);
Int5 = poly2poly(P,P5);
Int6 = poly2poly(P,P6);
Int7 = poly2poly(P,P7);
Int8 = poly2poly(P,P8);
Int9 = poly2poly(P,P9);

if (isempty(Int1)&&isempty(Int2)&&isempty(Int3)&&isempty(Int4)...
   &&isempty(Int5)&&isempty(Int6)&&isempty(Int7)&&isempty(Int8)&&...
   isempty(Int9))==0
    CCflag =1;
end
end

