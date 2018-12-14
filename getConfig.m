function config = getConfig( filename )
%GETCONFIG Summary of this function goes here
%   Detailed explanation goes here

% import file
fid = fopen([filename,'.cube']);

% remove headers lines 1-6
for i=1:6
    fgetl(fid);
end
% read molecule configuration lines 7-(7+number of molecules)
config_bohr = fscanf(fid, '%f %f %f %f %f', [5,38])';

% to angstroms
config = config_bohr(:,3:4) * 0.529177;
shift = mean(config);

config(:,1) = config(:,1) - shift(1);
config(:,2) = config(:,2) - shift(2);

fclose(fid);

end

