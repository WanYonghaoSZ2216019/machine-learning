function visualizeFit(X, mu, sigma2)
%VISUALIZEFIT Visualize the dataset and its estimated distribution.
%   VISUALIZEFIT(X, p, mu, sigma2) This visualization shows you the 
%   probability density function of the Gaussian distribution. Each example
%   has a location (x1, x2) that depends on its feature values.
%
%生成网格采样点，x1，x2轴有70个点，一共70*70个点 
[X1,X2] = meshgrid(0:.5:35); 

%计算得到每个网点对应的概率值
Z = multivariateGaussian([X1(:) X2(:)],mu,sigma2);
%重构Z，构造成X1维的矩阵
Z = reshape(Z,size(X1));

%画出数据点
plot(X(:, 1), X(:, 2),'bx');
hold on;
% Do not plot if there are infinities
%判断数组元素是否无界，有界就运行if内语句
if (sum(isinf(Z)) == 0)
%前三个参数分别对应x,y,z，等高线在10的-20次方和10的0次方之间，每次指数增加3来画
    contour(X1, X2, Z, 10.^(-20:3:0)');
end
hold off;

end