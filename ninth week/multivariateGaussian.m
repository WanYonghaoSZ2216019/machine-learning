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
%��������X�ڶ�Ԫ��˹�ֲ�����mu��Sigma2Ϊ�����ĸ����ܶȺ���
%��Ԫ��˹���ʺ�������ѧ��ʽ����������ѧϰ�ʼ�����
%k������������
k = length(mu);

%���Sigma2Ϊ��������Sigma2��Ϊ���Խ���Ԫ�أ��γ�Э�������Sigma2
%���Sigma2���Ǿ�����ôSigma2����Э������󣬲�ִ������if����
if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end

%����bsxfun��������X-mu��ÿ����������ȥmu
%��ʱ��X��ÿ��������������ȥ��Ӧ��muֵ
X = bsxfun(@minus, X, mu(:)');

%sum�еĲ���Ϊ2����ʾ��ÿ����ͣ��õ�������
%det��������������ʽ
%�����ʽ�ڱʼ�����
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end