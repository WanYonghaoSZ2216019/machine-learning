function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%
%randperm(size(X, 1))随机打乱1~size(X, 1)之间的数
randidx = randperm(size(X, 1));  
%在打乱的数字中选择前K个作为样本索引
centroids = X(randidx(1:K), :);







% =============================================================

end

