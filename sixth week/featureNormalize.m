function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.
%���ÿһ�����������ľ�ֵmu


mu = mean(X);

%bsxfun()�����Ĺ���:���������Ԫ���������Ķ�ֵ����
%���еĲ�����@����Ĳ���������X - mu

X_norm = bsxfun(@minus, X, mu);

%�����������ı�׼ƫ��
%y=std(x) ���x�ı�׼ƫ� x������vector����һ��matrix����
%��x��vector����y����x�ı�׼ƫ�
%��x��matrix����y�Ǹ�vector����ŵ�����ÿһ��/�еı�׼ƫ��

sigma = std(X_norm);

%��ɾ�ֵ��һ������

X_norm = bsxfun(@rdivide, X_norm, sigma);


% ============================================================

end
