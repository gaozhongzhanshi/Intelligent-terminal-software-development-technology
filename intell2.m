clc
clear
x=-2:0.1:2;
y=-2:0.1:2;
[X,Y]=meshgrid(x,y);%生成平面网格
Z=X.^2+sin(Y)*sin(Y);%计算网格点的值
mesh(X,Y,Z);%绘制二元函数
colormap([0 0 0]);%指定颜色
%双变量梯度下降
X=3;
Y=1;
n=0.1; %学习率
Z=X.^2+sin(Y)*sin(Y)
while(Z>1e-2)
    X=X-n*2*X;
    Y=Y-n*2*sin(Y)*cos(Y);
    Z=X.^2+sin(Y)*sin(Y);
end
%求偏导数
%syms x y z;
%diff(x^2+log(y)+sqrt(z),x)