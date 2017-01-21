function X = RandomPointGenerator(Probability,xGoal,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9)  
p=rand;
if p>Probability
    x = randi([0 200],1,1);
    y = randi([0 200],1,1);
else
    x=xGoal(1);
    y=xGoal(2);
end
flag = IsInPolygon(x,y,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
if flag == 0
   X =[x y 1];
else
    X=[x y 0];
end
end