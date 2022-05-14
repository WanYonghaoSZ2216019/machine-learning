function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.
%求出每一个特征向量的均值mu


mu = mean(X);

%bsxfun()函数的功能:两个数组间元素逐个计算的二值操作
%进行的操作有@后面的操作决定，X - mu

X_norm = bsxfun(@minus, X, mu);

%求特征向量的标准偏差
%y=std(x) 算出x的标准偏差。 x可以是vector或者一个matrix矩阵
%若x是vector，则y是算x的标准偏差。
%若x是matrix，则y是个vector，存放的是算每一列/行的标准偏差

sigma = std(X_norm);

%完成均值归一化函数

X_norm = bsxfun(@rdivide, X_norm, sigma);


% ============================================================

end
