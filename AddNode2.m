function T = AddNode2(xParent,yParent,x,y,T,config,i)
    field1 = 'Parent';  value1 = [xParent,yParent];
    field2 = 'Current';  value2 = [x,y];
    field3 = 'Index';  value3 = i;
    field4 = 'Config'; value4 = config;
    T{i}.Node = struct(field1,value1,field2,value2,field3,value3,field4,value4);
end