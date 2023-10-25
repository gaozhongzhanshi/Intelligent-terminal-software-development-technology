
points = [1, 3; 1, 4; 2, 2; 2, 3.8; 3, 2; 3.8, 3];
target_error = 0.1;

a = 0;
b = 0;
c = 0;

learning_rate = 0.01;
error = inf;

while error > target_error
    % 计算预测值和误差
    predictions = a * points(:, 1) + b * points(:, 2) + c;
    errors = predictions - points(:, 2);
    
    a = a - learning_rate * sum(errors .* points(:, 1));
    b = b - learning_rate * sum(errors .* points(:, 2));
    c = c - learning_rate * sum(errors);
    
    error = mean(abs(errors));
end

fprintf('拟合结果：a = %.2f, b = %.2f, c = %.2f\n', a, b, c);


