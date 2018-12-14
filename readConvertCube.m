function [ M, config ] = readConvertCube( filename, WFn )
%READCONVERTCUBE Summary of this function goes here
%   Detailed explanation goes here

WFfilename = [filename,'.K1.WF',int2str(WFn),'.MOD'];

% check to see if the xyzv file exists, convert if required
if exist([WFfilename,'.cube'], 'file') ~= 2
    error(['Missing cube file for:  ',WFfilename]);
elseif exist([WFfilename,'.xyzv'], 'file') ~= 2
    display('Converting CUBE into XYZV file ...');
    python('cube2xyz.py',['-f',WFfilename,'.cube'],['-o',WFfilename, ...
        '.xyzv'],'-A'); % convert to xyzv format
end

% read in xyz format
fid = fopen([WFfilename,'.xyzv'],'r');
M = fscanf(fid,'%f %f %f %f',[4,Inf]); 
M(1:2,:) = M(1:2,:) - 10.0;
config = getConfig(WFfilename);
fclose(fid);





end

