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
Probability = 0.2;

%Create Tree
RRTree={};
k=1;
K = 20000;
for iter=1:K
    % iter=0;
    % while(k<5)
    %     iter = iter+1;
    if iter == 1
        CurrentConfig=1;
        RRTree=AddNode2(NaN,NaN,xInitial(1),xInitial(2),RRTree,CurrentConfig,k);
        k=k+1;
    else
        %Assign a random point in the free space and check its location
        X = RandomPointGenerator(Probability,xGoal,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
        x = X(1);
        y = X(2);
        NotInObstacle = X(3);
        %%Shortest Distance
        if NotInObstacle == 1
            ClosestPoint = ShortestDistance(RRTree,x,y,k-1);
            xP = ClosestPoint(1);
            yP = ClosestPoint(2);
            if norm([xP;yP]-[x;y])<25
                %Line Collision Check Flag
                CCFlag = CheckLineCollision(xP,yP,x,y,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
                if CCFlag ==0
                    %Check Object Collision
                    if  CurrentConfig==1
                        FreetoGo = CheckObstacle(xP,yP,x,y,1,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
                        if FreetoGo == 1
                            RRTree = AddNode2(xP,yP,x,y,RRTree,CurrentConfig,k);
                        else
                            FreetoGo = CheckObstacle(xP,yP,x,y,2,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
                            if FreetoGo == 1
                                CurrentConfig =2;
%                                 BCflagP=SetBoundingBox(xP,yP,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
%                                 BCflag=SetBoundingBox(x,y,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
%                                 if (BCflagP || BCflag) ==0
                                    RRTree = AddNode2(xP,yP,x,y,RRTree,CurrentConfig,k);
%                                 end
                            else
                                continue;%Goes to the next iteration
                            end
                            
                        end
                        
                    elseif CurrentConfig == 2
                        FreetoGo = CheckObstacle(xP,yP,x,y,2,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
                        if FreetoGo == 1
                            RRTree = AddNode2(xP,yP,x,y,RRTree,CurrentConfig,k);
                        else
                            FreetoGo = CheckObstacle(xP,yP,x,y,1,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
                            if FreetoGo == 1
                                CurrentConfig =1;
%                                 BCflagP=SetBoundingBox(xP,yP,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
%                                 BCflag=SetBoundingBox(xP,yP,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8,X9,Y9);
%                                 if (BCflagP||BCflag)==0
                                    RRTree = AddNode2(xP,yP,x,y,RRTree,CurrentConfig,k);
%                                 end
                            else
                                continue;%Goes to the next iteration
                            end
                            
                        end
                    end
                    
                    if  isequal(RRTree{1,k}.Node.Current,xGoal)== 1
                        break;
                    end
                    k=k+1;
                end
            end
        end
    end
end

hold on
Traceback2(xGoal,xInitial,RRTree,k);
axis equal