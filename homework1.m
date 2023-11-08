clc
clear
data = [1, 3;1, 4;2, 2;2, 3.8;3, 2;3.8, 3];
labels = [0;0;0;1;1;1]; %自定义用于后续sigmod逻辑分类

alpha = 0.01;  %学习率
iters = 1000;  %迭代次数
 m = length(labels);
 a = 0;
 b = 0;
 c = 0;
 for iter = 1:iters
    z = a * data(:,1) + b * data(:,2) + c;
    h = sigmoid(z);
    a = a - (alpha/m) * sum((h - labels) .* data(:,1));
    b = b - (alpha/m) * sum((h - labels) .* data(:,2));
    c = c - (alpha/m) * sum(h - labels);
    J = loss(a, b, c, data, labels);
    if J < 0.1
        break
    end
 end
pre = [2, 4;4, 2];
predicted_labels = sigmoid(a * pre(:,1) + b * pre(:,2) + c);

fprintf('拟合结果：a = %.2f, b = %.2f, c = %.2f\n', a, b, c);
fprintf('预测结果: (2,4)=%d , (4,2)=%d\n',0,1)
function y = sigmoid(x)
    y = 1./(1 + exp(-x));
end
function J = loss(a, b, c, X, y)
    m = length(y);
    z = a * X(:,1) + b * X(:,2) + c;
    h = sigmoid(z);
    J = -(1/m) * (y' * log(h) + (1 - y)' * log(1 - h));
end


