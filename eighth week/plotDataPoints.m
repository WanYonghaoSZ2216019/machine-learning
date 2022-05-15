function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
%�о�����ѡKҲ����
palette = hsv(K + 1);  %hsv��������K+1����ɫRGB����ÿһ�д���һ����ɫ
colors = palette(idx, :);     %ÿһ��idx��Ӧһ����ɫ����K+1����ɫѡK����ɫ
%K = 3
%size(idx) = 300��1
%size(palette) = 4��3
%size(X) = 300��2
%size(colors) = 300��3
% Plot the data������ɢ��ͼ
%scatter(x,y,sz,c) ָ��Բ��ɫ��Ҫ����ͬ����ɫ��������ԲȦ���뽫 c ָ��Ϊ��ɫ���ƻ� RGB ��Ԫ�顣Ҫʹ�ò�ͬ����ɫ���뽫 c ָ��Ϊ�������� RGB ��Ԫ����ɵ����о���
%�����ĵ�һ��Ϊ�����꣬�ڶ���Ϊ�����꣬��ɫ��������X��Ӧ��idx��ȷ��
scatter(X(:,1), X(:,2), 15, colors);

end
