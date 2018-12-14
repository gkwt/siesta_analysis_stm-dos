function plotCubeSlice( M, z, xlims, ylims, molec )
%PLOTCUBESLICE Summary of this function goes here
%   Detailed explanation goes here

% get nearest z slice
n = size(M);
ind = find(abs(M(3,:)- z) == min(abs(M(3,:)- z)));

slice2d = M(:,ind);
slice2d(3,:) = [];
m = size(slice2d);

XX = reshape(slice2d(1,:),[sqrt(m(2)),sqrt(m(2))]);
YY = reshape(slice2d(2,:),[sqrt(m(2)),sqrt(m(2))]);
VV = reshape(slice2d(3,:),[sqrt(m(2)),sqrt(m(2))]);

figure;
hold on;
fig = surf(XX,YY,VV);
if nargin > 2
    xlim(xlims);
    ylim(ylims);
end
set(fig, 'edgecolor','none');
colorbar;
if nargin > 4
    scatter3(molec(:,1),molec(:,2),max(max(get(fig,'Zdata')))*ones(1,length(molec)),100,'w');
end
hold off;

end

