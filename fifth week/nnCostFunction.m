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
%Ϊ��������ƫ��ֵ��
X = [ones(m,1) X];
%�������ز�ļ���ֵ��
a2 = sigmoid(X * Theta1');
%Ϊ���ز����ƫ��ֵ
a2 = [ones(m,1) a2];
%���������Ԫ��ƫ��ֵ
a3 = sigmoid(a2 * Theta2');
%������ۺ���ǰ�Ƚ������yת��Ϊ0��1��ʾ��������
%�ȳ�ʼ��y1����m��kά������ɣ�ÿ��kά������1��Ԫ��Ϊ1������Ԫ��Ϊ0��ʹ��forѭ��ʵ��
%ԭ����y��0~9�е�ĳ�����֣�����y(1) = 3��... ,y(m) = 6����Ҫʹ��forѭ�����0��1��ʾ������
y1 = zeros(m,num_labels);                          
for i = 1:m
y1(i,y(i))  = 1;    
endfor
%��ʱÿһ�о���ÿ�����������������������ۺ�����
J = sum(diag(-y1 * log(a3)' - (1 - y1) * log(1 - a3)')) / m + (sum(sum(Theta1(:,2:end) .^ 2)) + sum(sum(Theta2(:,2:end) .^ 2))) * lambda / (2 * m);  %������������


%���������з��򴫲�
delta1 = zeros(size(Theta1))       %��ʼ��������
delta2 = zeros(size(Theta2)) 

%ʹ��forѭ�����������󣬻�����Ϊ������      
for i = 1 : m
  x1 = X(i,:);         %x1��¼��i������������ֵ     
  a2 = sigmoid(x1 * Theta1');   %��¼��i�������ĵڶ��㼤��ֵ
  a2 = [ones(1) a2];            %Ϊ�ڶ������ƫ����
  %z3 = a2 * Theta2';
  a3 = sigmoid(a2 * Theta2');   %��¼��i�������ĵ����㼤��ֵ
  err3 = a3 - y1(i,:);          %��������������������ֵ��ȥ��ʵֵ
  z2 = x1 * Theta1';   
  err2 = err3 * Theta2(:,2:end) .* sigmoidGradient(z2);  %g(z)�ĵ���
  delta1 = delta1 + err2' * x1;  %��ʽ
  delta2 = delta2 + err3' * a2;  %��ʽ
endfor


Theta1_grad = delta1 / m;   %��������õ����ȡƽ��
Theta1_grad(:,2:end) += Theta1(:,2:end) * lambda / m;
%ƫ�����Ҫ����Ȩ��
Theta2_grad = delta2 / m;
Theta2_grad(:,2:end) += Theta2(:,2:end) * lambda / m;








% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
