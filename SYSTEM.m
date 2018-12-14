classdef SYSTEM
    %SYSTEM
    %   Define a class for the system. Contains all variables and functions
    %   required.
    
    properties
        filename % string that indicates filename
        DOS % 2D array containing DOS(E) information
        fermiE % fermi energy of system
        orbInd % array of identified orbitals
        orbE % corresponding energies of orbitals
        fInd % index of orbital nearest Fermi within orbInd
        fE % energy of orbital nearest Fermi
        config % configuartion of molecule from cube files
    end
    
    methods
        function obj = SYSTEM(filename, n) % constructor, intialise all variables
            obj.filename = filename;
            [obj.orbInd, obj.orbE, obj.fermiE, obj.fInd, obj.fE, ...
                obj.DOS] = readEigDOS(filename);
            obj.config = getConfigXYZ(obj.filename, n);
        end
        function plotDOS(obj) % plot the DOS rho(E)
            plot(obj.DOS(:,1), obj.DOS(:,2));
            xlabel('Energy (eV)');
            ylabel('PDOS (eV^{-1})');
        end
        function plotFermi(obj) % plot the fermi energy as a veritcal line
            limsy = get(gca,'ylim');
            ylim([0.0, limsy(2)]);
            plot([obj.fermiE,obj.fermiE],[0.0,limsy(2)]);
        end
        function obj = shift(obj, E)
            obj.DOS(:,1) = obj.DOS(:,1) + E;
            obj.fermiE = obj.fermiE + E;
            obj.orbE = obj.orbE + E;
            obj.fE = obj.fE + E;
        end
    end
    
end

