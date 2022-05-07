function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
%为输入层加上偏置值：
X = [ones(m,1) X];
%计算隐藏层的激活值：
a2 = sigmoid(X * Theta1');
%为隐藏层加上偏置值
a2 = [ones(m,1) a2];
%计算输出单元的偏置值
a3 = sigmoid(a2 * Theta2');
%计算代价函数前先将输出的y转换为0，1表示的向量：
%先初始化y1是由m个k维向量组成，每个k维向量中1个元素为1，其他元素为0，使用for循环实现
%原本的y是0~9中的某个数字，比如y(1) = 3，... ,y(m) = 6，需要使用for循环变成0，1表示的向量
y1 = zeros(m,num_labels);                          
for i = 1:m
y1(i,y(i))  = 1;    
endfor
%此时每一行就是每个样本的输出向量，计算代价函数：
J = sum(diag(-y1 * log(a3)' - (1 - y1) * log(1 - a3)')) / m + (sum(sum(Theta1(:,2:end) .^ 2)) + sum(sum(Theta2(:,2:end) .^ 2))) * lambda / (2 * m);  %两个参数矩阵


%计算误差，进行反向传播
delta1 = zeros(size(Theta1))       %初始化误差矩阵
delta2 = zeros(size(Theta2)) 

%使用for循环更新误差矩阵，基本都为行向量      
for i = 1 : m
  x1 = X(i,:);         %x1记录第i个样本的特征值     
  a2 = sigmoid(x1 * Theta1');   %记录第i个样本的第二层激活值
  a2 = [ones(1) a2];            %为第二层加上偏置项
  %z3 = a2 * Theta2';
  a3 = sigmoid(a2 * Theta2');   %记录第i个样本的第三层激活值
  err3 = a3 - y1(i,:);          %计算输出层的误差，几个激活值减去真实值
  z2 = x1 * Theta1';   
  err2 = err3 * Theta2(:,2:end) .* sigmoidGradient(z2);  %g(z)的导数
  delta1 = delta1 + err2' * x1;  %公式
  delta2 = delta2 + err3' * a2;  %公式
endfor


Theta1_grad = delta1 / m;   %个样本求得的误差取平均
Theta1_grad(:,2:end) += Theta1(:,2:end) * lambda / m;
%偏置项不需要更新权重
Theta2_grad = delta2 / m;
Theta2_grad(:,2:end) += Theta2(:,2:end) * lambda / m;








% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
