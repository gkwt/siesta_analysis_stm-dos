function config = getConfigXYZ( filename, n)
%GETCONFIG Summary of this function goes here
%   Detailed explanation goes here

% import file
fid = fopen([filename,'.xyz']);

% remove headers lines 1-2
for i=1:2
    fgetl(fid);
end
% read the first n lines of configuration
config_bohr = fscanf(fid, '%s %f %f %f', [4,n])';

% to angstroms
config = config_bohr(:,2:3); %* 0.529177;
shift = mean(config);

config(:,1) = config(:,1) - shift(1);
config(:,2) = config(:,2) - shift(2);

fclose(fid);

end

