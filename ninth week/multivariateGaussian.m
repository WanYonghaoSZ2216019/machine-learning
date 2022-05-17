function p = multivariateGaussian(X, mu, Sigma2)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. If Sigma2 is a matrix, it is
%    treated as the covariance matrix. If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
%
%计算样本X在多元高斯分布下以mu和Sigma2为参数的概率密度函数
%多元高斯概率函数的数学公式在吴恩达机器学习笔记中有
%k是特征的数量
k = length(mu);

%如果Sigma2为向量，则将Sigma2作为主对角线元素，形成协方差矩阵Sigma2
%如果Sigma2就是矩阵，那么Sigma2就是协方差矩阵，不执行下列if代码
if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end

%利用bsxfun函数计算X-mu，每个样本都减去mu
%此时的X是每个样本特征都减去对应的mu值
X = bsxfun(@minus, X, mu(:)');

%sum中的参数为2，表示对每行求和，得到列向量
%det用于求矩阵的行列式
%这个公式在笔记中有
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end