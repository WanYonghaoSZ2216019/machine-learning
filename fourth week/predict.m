function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);     %˵��ÿһ�д���һ������
num_labels = size(Theta2, 1); %˵��ÿһ�д���һ��ָ�򼤻Ԫ��Ȩ��

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
%��Ȼ��������Ϊ����������
X = [ones(m,1) X];  %����ƫ����
a2 = sigmoid(X * Theta1'); %����ڶ�����Ԫ�ļ���ֵ
a2 = [ones(m,1) a2];     %�ڶ������ƫ��ֵ
a3 = sigmoid(a2 * Theta2'); %�����������Ԫ�ļ���ֵ
[i, j] = max(a3, [], 2);    %�������a3ÿһ�е����ֵ
p = j;




% =========================================================================


end
