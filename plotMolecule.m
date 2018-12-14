% Plot out the program and find out the bounds of Denchar

% just molecule on it's own
fid = fopen('PTCDA/PTCDA.xyz');
fid = fopen('Ag_PTCDA/Ag_PTCDA.xyz');
% remove headers lines 1-2
for i=1:2
    fgetl(fid);
end
coord = fscanf(fid, '%s %f %f %f ', [4,38]);
fclose(fid);

coord(1,:) = [];
coord(3,:) = [];

center = [mean(coord(1,:)), mean(coord(2,:))];

% molecule is 7A by 11A
xrange = [center(1)-10.0,center(1)+10.0];
yrange = [center(2)-10.0,center(2)+10.0];

figure;
hold on;
scatter(coord(1,:), coord(2,:));
scatter(center(1),center(2));
xlim(xrange);
ylim(yrange);
hold off;