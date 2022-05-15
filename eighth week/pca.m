function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%   计算协方差矩阵的特征向量，以及S矩阵对角线上的特征值

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%
%计算协方差矩阵A
%A = 0;
%for i = 1:m
	%temp = X(i,:)' * (X(i,:));
	%A = A + temp;
%endfor
%A = A/m;

A = (X'*X)/m;

%通过svd函数求解特征向量
[U, S, V] = svd(A);





% =========================================================================

end
