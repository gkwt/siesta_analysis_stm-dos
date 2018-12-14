function [ slice ] = plotDencharSlice( filename, WFn, xlims, ylims, molec )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

WFfilename = [filename,'/',filename,'.CON.K1.WF',num2str(WFn),'.MOD'];

fid = fopen(WFfilename);
slice = fscanf(fid,'%f', [3,Inf]);
fclose(fid);

m = size(slice);
b2a = 0.529177;
XX = reshape(slice(1,:)*b2a,[sqrt(m(2)),sqrt(m(2))]);
YY = reshape(slice(2,:)*b2a,[sqrt(m(2)),sqrt(m(2))]);
VV = reshape(slice(3,:),[sqrt(m(2)),sqrt(m(2))]);

hold on;
fig = surf(XX,YY,VV);
if nargin > 2
    xlim(xlims);
    ylim(ylims);
end
set(fig, 'edgecolor','none');
colorbar;
if nargin > 4
    scatter3(molec(:,1),molec(:,2),max(max(get(fig,'Zdata')))*...
        ones(1,length(molec)),100,'w','LineWidth',2);
end
plot([4.0,9.0],[-9.0,-9.0],'Color','w','LineWidth',5);
text(4.8,-8.25, '5.0 \AA','Color',[1 1 0.99],'FontSize',30, 'Interpreter', 'latex');
set(gca,'XTick',[],'YTick',[])
set(gca,'Fontsize',25)
hold off;


end

