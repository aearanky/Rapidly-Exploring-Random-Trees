function ClosestPoint = ShortestDistance(RRTree,Xc,Yc,iterations)
MinCost = 1000;
for i=1:iterations
    A = [RRTree{1,i}.Node.Current(1);...
         RRTree{1,i}.Node.Current(2)];
    B = [Xc;...
         Yc];
    min = norm(A-B);
    if min<MinCost
        MinCost = min;
        ClosestPoint = [A(1) A(2) MinCost];
    end
end
end 