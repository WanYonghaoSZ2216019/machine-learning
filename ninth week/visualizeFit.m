function visualizeFit(X, mu, sigma2)
%VISUALIZEFIT Visualize the dataset and its estimated distribution.
%   VISUALIZEFIT(X, p, mu, sigma2) This visualization shows you the 
%   probability density function of the Gaussian distribution. Each example
%   has a location (x1, x2) that depends on its feature values.
%
%������������㣬x1��x2����70���㣬һ��70*70���� 
[X1,X2] = meshgrid(0:.5:35); 

%����õ�ÿ�������Ӧ�ĸ���ֵ
Z = multivariateGaussian([X1(:) X2(:)],mu,sigma2);
%�ع�Z�������X1ά�ľ���
Z = reshape(Z,size(X1));

%�������ݵ�
plot(X(:, 1), X(:, 2),'bx');
hold on;
% Do not plot if there are infinities
%�ж�����Ԫ���Ƿ��޽磬�н������if�����
if (sum(isinf(Z)) == 0)
%ǰ���������ֱ��Ӧx,y,z���ȸ�����10��-20�η���10��0�η�֮�䣬ÿ��ָ������3����
    contour(X1, X2, Z, 10.^(-20:3:0)');
end
hold off;

end