function flag = IsInPolygon(x,y,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9)
if (inpolygon(x,y,X1,Y1) || inpolygon(x,y,X2,Y2)|| inpolygon(x,y,X3,Y3)||...
    inpolygon(x,y,X4,Y4)|| inpolygon(x,y,X5,Y5) || inpolygon(x,y,X6,Y6)||...
    inpolygon(x,y,X7,Y7) || inpolygon(x,y,X8,Y8) || inpolygon(x,y,X9,Y9))   
    flag=1;
else
    flag=0;
end
end