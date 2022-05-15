function plotProgresskMeans(X, centroids, previous, idx, K, i)
%PLOTPROGRESSKMEANS is a helper function that displays the progress of 
%k-Means as it is running. It is intended for use only with 2D data.
%   PLOTPROGRESSKMEANS(X, centroids, previous, idx, K, i) plots the data
%   points with colors assigned to each centroid. With the previous
%   centroids, it also plots a line between the previous locations and
%   current locations of the centroids.
%

% Plot the examples
%为每个样本数据点绘制图像
plotDataPoints(X, idx, K);

% Plot the centroids as black x's
%绘制新的聚类中心图像，横坐标是聚类矩阵的第一列，纵坐标是第二列
plot(centroids(:,1), centroids(:,2), 'x', ...
     'MarkerEdgeColor','k', ...
     'MarkerSize', 10, 'LineWidth', 3);

% Plot the history of the centroids with lines
for j=1:size(centroids,1)
    %在现有的图像中的两个点之间画一条直线
    drawLine(centroids(j, :), previous(j, :));
end

% Title
title(sprintf('Iteration number %d', i))

end

