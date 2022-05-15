function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%
%centroid��ÿһ�д���һ����������
% Set K
K = size(centroids, 1);
m = size(X,1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
%Ҫ��ʹ��forѭ��ʵ��

for i = 1:m
	[val,idx(i)] = min(sum(((X(i,:) - centroids) .^ 2)'));
endfor

%Ҳ����ʹ�����д���
%temp = zeros(K,1);
%for i = 1:m
    %for j=1:K
        %value(j)=sum((X(i,:)-centroids(j,:)) .^ 2);
    %end
%[val,ind]=min(value);
%idx(i)=ind;
%end 

% =============================================================

end

