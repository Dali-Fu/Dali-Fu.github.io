function y = simulationPath(initialValue,limitValue, length)
%simulationPath 新建函数来模拟变量的变化路径
%   此处显示详细说明
%   目前我们编写的函数都只是一个输出变量，如果有多个的话可以使用[output1,output2]
%   输入变量
%   输出变量
    x = 0 : length;
    y = sign ( initialValue - limitValue ) ./ (x + 1 / abs( initialValue - limitValue )) 
        +limitValue;
end