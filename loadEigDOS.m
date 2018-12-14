function [ dft_str ] = loadEigDOS( filename, n )
%LOADDATA Load DFT data into a structure
%   Detailed explanation goes here

% constructor, intialise all variables
dft_str.filename = filename;
[dft_str.orbInd, dft_str.orbE, dft_str.fermiE, dft_str.fInd, dft_str.fE, ...
    dft_str.DOS] = readEigDOS(filename);
dft_str.config = getConfigXYZ(dft_str.filename, n); 


end

