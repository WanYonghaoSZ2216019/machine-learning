function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
%感觉这里选K也可以
palette = hsv(K + 1);  %hsv函数返回K+1种颜色RGB矩阵，每一行代表一种颜色
colors = palette(idx, :);     %每一种idx对应一种颜色，从K+1种颜色选K种颜色
%K = 3
%size(idx) = 300×1
%size(palette) = 4×3
%size(X) = 300×2
%size(colors) = 300×3
% Plot the data，绘制散点图
%scatter(x,y,sz,c) 指定圆颜色。要以相同的颜色绘制所有圆圈，请将 c 指定为颜色名称或 RGB 三元组。要使用不同的颜色，请将 c 指定为向量或由 RGB 三元组组成的三列矩阵
%样本的第一类为横坐标，第二列为纵坐标，颜色根据样本X对应的idx所确定
scatter(X(:,1), X(:,2), 15, colors);

end
