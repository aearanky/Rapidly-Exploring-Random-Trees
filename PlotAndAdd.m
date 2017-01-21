function RRTree = PlotAndAdd(xP,yP,x,y,RRTree,k)
    %Plot the Point
    hold on
    plot(x,y,'g+');
    %Make a Connection
    Color = 'r';
    PlotLine(xP,yP,x,y,Color);
    %Add Node to tree
    RRTree=AddNode(xP,yP,x,y,RRTree,k);                                
end