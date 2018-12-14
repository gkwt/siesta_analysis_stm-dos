function [ orbInd, orbE, fermiE, homoInd, homoE, DOS] = readEigDOS( filename )
%readEigDOS 
%   read in DOS file and plot
% 

% read EIG file
fid_EIG = fopen([filename,'.EIG'],'r');
eigVals = fscanf(fid_EIG, '%f ');
fermiE = eigVals(1); % fermi energy
n_EIG = eigVals(2); % total orbitals
eigVals(1:5) = []; 
fclose(fid_EIG);

% read DOS file
fid_DOS = fopen(['/proj_',filename,'.out'],'r');
densOfState= fscanf(fid_DOS,'%f %f %f',[3,Inf]); 
fclose(fid_DOS);

% peak energies from DOS
[pks,locs] = findpeaks(densOfState(2,:)'); 
stateE = densOfState(1,locs);

% corresponding orbital energies and indices
orbInd = zeros(length(stateE),1);
for i = 1:length(stateE)
    [~, orbInd(i)] = min(abs(eigVals - stateE(i)));
end
orbE = eigVals(orbInd); % orbital energies of peaks

% get HOMO information
[~, homoInd] = min(abs(orbE(orbE<fermiE) - fermiE));
homoE = orbE(homoInd); % index of HOMO wrt to orbInd

DOS = [densOfState(1,:)',densOfState(2,:)'];



% figure;
% hold on;
% % plot([eigVals,eigVals], repmat([0,100],1,size(eigVals,2)),'-k');
% histogram(eigVals,1500);
% title(filename);
% xlim([-6,-2]);
% hold off;

end

