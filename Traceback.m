function Traceback(xGoal,xInitial,RRTree,k)  
% k=6;
for i=1:k    
    if isequal(RRTree{1,i}.Node.Current,xGoal) == 1
        break;
    end            
end
recursive(i,xInitial,RRTree,k);
end

function recursive(i,xInitial,RRTree,k)
    current = RRTree{1,i}.Node.Current
    if isequal(current,xInitial)==0
        parent = RRTree{1,i}.Node.Parent
        xc=current(1);
        yc=current(2);
        xp=parent(1);
        yp=parent(2);
        line([xc,xp],[yc,yp],'LineWidth',3,'Color','b','LineStyle','-.');
        prev=parent;
        for i=1:k
            if isequal(RRTree{1,i}.Node.Current,prev) == 1
                break;
            end
        end
    recursive(i,xInitial,RRTree,k);
    end
end