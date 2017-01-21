clc
clear
[X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9]=CreateObstacleSpace();
hold on 
xInitial = [30,160];
plot(xInitial(1),xInitial(2),'kO','MarkerSize',20); 
hold on 
xGoal=[160,30];
plot(xGoal(1),xGoal(2),'mO','MarkerSize',20); 

%Set the Goal Biasing Probability
Probability = 0.5;

%Create Tree
RRTree={};
k=1;
K = 1000;
for iter=1:K
% iter=0;
% while(k<10)
%     iter = iter+1;
    if iter == 1
        RRTree=AddNode(NaN,NaN,xInitial(1),xInitial(2),RRTree,k); 
        k=k+1;
    else
        %Assign a random point in the free space and check its location
        X = RandomPointGenerator(Probability,xGoal,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9); 
        x = X(1);
        y = X(2);
        NotInObstacle = X(3);
        %Shortest Distance
        if NotInObstacle == 1 
            ClosestPoint = ShortestDistance(RRTree,x,y,k-1);
            xP = ClosestPoint(1);
            yP = ClosestPoint(2);
            %Line Collision Check Flag
            CCFlag = CheckLineCollision(xP,yP,x,y,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
            if CCFlag ==0
                %Plot the Point
                hold on
                plot(x,y,'g+');
                %Make a Connection
                Color = 'r';
                PlotLine(xP,yP,x,y,Color);
                %Add Node to tree
                RRTree=AddNode(xP,yP,x,y,RRTree,k);                 
                rx = RRTree{1,k}.Node.Current(1);
                ry = RRTree{1,k}.Node.Current(2);
                if  isequal([rx ry],xGoal)== 1
                    iter
                    k
                    break;
                end               
                k=k+1;
            end
        end
    end    
end

hold on
% k=k-1;
Traceback(xGoal,xInitial,RRTree,k);




