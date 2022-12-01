%% 向量/矩阵的创建I
a = [1 2 3]

b = [1; 4]

A = [1, 2, 3; 4 5 6]

%中括号包裹，行内用空格或英文逗号分隔，行间用英文分号分隔。
a = 1 : 3
a = 1 : 0.3 : 2
%仅用于创建向量，且为行向量。
%英文冒号分隔，默认步长为1，也可自定义步长。
%向量的最后一个元素不一定是终止值。

a = linspace (1, 3, 3)
a = rand (2, 3)
% 部分创建向量/矩阵的函数及其关键词列表如下，可通过help或doc指
% 令查看具体功能。
% linspace 线性向量  logspace 对数向量
% zeros 全0          ones 全1
% eye 单位           diag 对角
% rand 均匀随机      randn 正态随机
% randi 整数随机     magic 幻方
% 更多信息参见help elmat。

% 由其他向量/矩阵组合

A = [linspace(1,10,4); logspace(0,1,4)]

a = 1 : 3;
b = [4; 7];
c = [5, 6; 8 9];
B = [a; b, c]
% 切片操作，MATLAB是按列读取矩阵元素的。
A = [1 2 3; 4 5 6; 7 8 9]
A(1, 3)
A(2, :)
A(:, 2)
A([1 , 3], 1 : 2)
A(:)
A(7)
%% 矩阵的运算
% 矩阵乘法要求两边矩阵的行列匹配。
% 带点号的运算符号为对应位置元素运算，要求两边矩阵规模一致。
% 区分左除和右除主要是因为除数可能为矩阵，上述例子分别等价于A右乘B逆和A左乘B逆。
a = [1 2];
b = [3 4; 5 6];
a * b
b * a %会出错
A = [1 2; 3 4];
B = [5 6; 7 8];
A * B
A .* B
A / B
B \ A

%% 常用函数
x=[0:pi/4:pi];
A=[1,2,3; 4,5,6];
y1=sin(x)
y2=exp(A)
y3=sqrt(A)
% 函数作用在矩阵的每个分量上！
%% 可视化 绘制函数图像
x = linspace (0, 2 * pi , 100) ;
y1 = sin (x);
plot (x, y1);
title ('figure  of sin (x)');%添加标题
xlabel ('x');%添加横坐标
ylabel ('y');%添加纵坐标
legend ('sin (x)');%添加图例

y2 = cos (x);
plot (x, y1 , '-ro ', x, y2 , '-b*');
y3 = log (x);
hold on;%保留当前绘图窗口中的图像
grid on;%显示网格
plot (x, y3 , '-mx ');
% 更多信息参见doc plot。
doc plot
%% 函数编程
% 函数的主要目的是将一些相似操作的共同点提取出来，不同点通过参数的形式来体现。
% 点击【新建】【函数】，建立一个一个可以验证某个正整数是否为素数的函数isPrime
isPrime(1)
isPrime(2)
isPrime(4)
% 匿名函数是针对较简短的函数而设计的，可以避免编写函数文件。
f = @(x, y) x^2 + y^2;
y = f(2, 3)
f = @(x) cos (x) .* sin (x) + 1;
x = 0 : pi / 20 : pi;%x从0到π间隔20，共21个点
y = f(x);
plot (x, y, 'ro -');
% *注意区分实际变量和函数的参数*。

% 根据函数表达式自动绘图
f = @(x) cos (x) .* sin (x) + 1;
fplot(f);
fplot(f,'b-*') % 指定曲线性质：点、线、颜色
fplot(f,'b-*',[-5,1]) % 指定绘图区间
%% 绘制变化路径图像I
% 1.二维图像绘制
%   step1.编写simulationPath函数
%   step2.编写绘制图像的脚本drawFigure1&2
% 2.三维图像绘制
%   在福利分析与最优政策制定时会使用到

t=0:pi/20:10*pi;
x=sin(t);
y=cos(t);
z=2*t;
plot3(x,y,z);

[X,Y]=meshgrid(-3:1/8:3);
Z=peaks(X,Y);
mesh(X,Y,Z);%绘制三维曲面的网格图
doc mesh

x=-8:0.5:8; y=-8:0.5:8;
[X,Y]=meshgrid(x,y);
r=sqrt(X.^2+Y.^2)+eps;
Z=sin(r)./r;
surf(X,Y,Z);
doc surf %绘制三维曲面的表面图