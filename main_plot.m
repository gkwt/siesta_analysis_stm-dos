% run the file
clear all;
close all;

addpath('F:\garytom\DFT\PTCDA\2ML_NaCl_Au_PTCDA')
addpath('F:\garytom\DFT\PTCDA\2ML_NaCl_Ag_PTCDA')

% Generate all system classes and fill in variables from SIESTA data
AuP = loadEigDOS('2ML_NaCl_Au_PTCDA', 38);
AgP = loadEigDOS('2ML_NaCl_Ag_PTCDA', 38);

pl = [-10.0, 10.0];

HLgap_vec = zeros(1,5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P_H = P.fInd;
% P_L = P.fInd+1;
% P_L1 = P.fInd+2;
% 
% HLgap = abs(P.orbE(P_H) - P.orbE(P_L));
% HLgap_vec(1) = HLgap;
% P_mid = P.orbE(P_H)+HLgap/2.;

x_width=20.0 ;y_width=3.5;
figure;
set(gcf, 'PaperUnits', 'inches');
set(gca,'DefaultLineLineWidth',2)
hold on;
AuP.plotDOS();
xlim([-7.0,-2.0]); ylim([0,15.0]);
AuP.plotFermi();
hold off;

figure;
set(gcf, 'PaperUnits', 'inches');
set(gca,'DefaultLineLineWidth',2)
hold on;
AgP.plotDOS();
xlim([-6.0,-1.0]); ylim([0,20.0]);
AgP.plotFermi();
hold off;

% % title('PDOS of PTCDA');
% % text(P.orbE(P_H), 7, sprintf('HOMO'))
% % text(P.orbE(P_L), 7, sprintf('LUMO'))
% % text(P_mid-0.5, 10, sprintf('%f', HLgap),'FontSize',15)
% set(gca,'Fontsize',20)
% hold off;
% set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
% saveas(gcf,'figures/PTCDA_PDOS.png')
% 
% figure;
% P_homo1 = plotDencharSlice(P.filename, P.orbInd(P_H), pl, pl, P.config);
% title('HOMO')
% saveas(gcf,'figures/PTCDA_HOMO.png')
% figure;
% P_homo = plotDencharSlice(P.filename, P.orbInd(P_L), pl, pl, P.config);
% title('LUMO')
% saveas(gcf,'figures/PTCDA_LUMO.png')
% figure;
% P_lumo = plotDencharSlice(P.filename, P.orbInd(P_L1), pl, pl, P.config);
% title('LUMO+1')
% saveas(gcf,'figures/PTCDA_LUMO1.png')
% 


% plot the change in gap size
figure;
hold on;
plot(0:3,ones(4,1)*HLgap_vec(1),'--','LineWidth',2)
plot([0:3]',HLgap_vec(2:end),'o','MarkerSize',7, 'MarkerFaceColor','b');
ylabel('Free PTCDA \Delta (eV)')
xlabel('Number of NaCl layers (n)')
set(gca,'Fontsize',20)
hold off;


figure;
hold on;
set(gca,'Fontsize',20)
set(gca,'DefaultLineLineWidth',1.5)
P.plotDOS();
AgP.plotDOS();
AgP1.plotDOS();
AgP2.plotDOS();
AgP3.plotDOS();
xlim([-7.0,-2.0]); ylim([0,15.0]);
%title('PDOS of PTCDA on nML-NaCl/Ag(111)');
lgd = legend('free','Ag','1ML NaCl','2ML NaCl','3ML NaCl');
lgd.FontSize = 10;
hold off;


