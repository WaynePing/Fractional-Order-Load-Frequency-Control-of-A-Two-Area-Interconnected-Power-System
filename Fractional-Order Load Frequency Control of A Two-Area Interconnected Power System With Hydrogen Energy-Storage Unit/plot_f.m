
%% 阶跃 f1
figure(1);
hold on; 
plot(GBOPIDf1,'color',[0.85 0.325 0.098],'LineStyle',':'); 
plot(PSOFOPIDf1,'color',[0.494 0.184 0.556],'LineStyle','-.');  %
plot(MDVAFOPIDf1,'color',[0.929 0.694 0.125],'LineStyle','--');  
plot(WOAFOPIDf1,'color',[0.466 0.674 0.188],'LineStyle','-');  
plot(GBOFOPIDf1,'color',[0.301 0.745 0.933],'LineStyle','-');  %RUQL-L
plot(IGBOFOPIDf1,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','PSO-FOPID[22]','MDVA-FOPID[20]','WOA-FOPID[19]','GBO-FOPID','EGBO-FOPID');
%为y轴添加标签
ylabel('\Delta\itf_{\rm1}\rm/Hz');
xlabel('\itt\rm/s');
box on;
%% f2
figure(2);
hold on; 
plot(GBOPIDf2,'color',[0.85 0.325 0.098],'LineStyle',':'); 
plot(PSOFOPIDf2,'color',[0.494 0.184 0.556],'LineStyle','-.');  %
plot(MDVAFOPIDf2,'color',[0.929 0.694 0.125],'LineStyle','--');  
plot(WOAFOPIDf2,'color',[0.466 0.674 0.188],'LineStyle','-');  
plot(GBOFOPIDf2,'color',[0.301 0.745 0.933],'LineStyle','-');  %RUQL-L
plot(IGBOFOPIDf2,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','PSO-FOPID[22]','MDVA-FOPID[20]','WOA-FOPID[19]','GBO-FOPID','EGBO-FOPID');
%为y轴添加标签
ylabel('\Delta\itf_{\rm1}\rm/Hz');
xlabel('\itt\rm/s');
box on;
%% P
figure(2);
hold on; 
plot(GBOPIDP,'color',[0.85 0.325 0.098],'LineStyle',':'); 
plot(PSOFOPIDP,'color',[0.494 0.184 0.556],'LineStyle','-.');  %
plot(MDVAFOPIDP,'color',[0.929 0.694 0.125],'LineStyle','--');  
plot(WOAFOPIDP,'color',[0.466 0.674 0.188],'LineStyle','-');  
plot(GBOFOPIDP,'color',[0.301 0.745 0.933],'LineStyle','-');  %RUQL-L
plot(IGBOFOPIDP,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','PSO-FOPID[22]','MDVA-FOPID[20]','WOA-FOPID[19]','GBO-FOPID','EGBO-FOPID');
ylabel('\Delta\itP_{\rm12}\rm/pu');
xlabel('\itt\rm/s');
%doc 指定坐标轴刻度值和标签
 %set(gca,'unit','centimeters','position',[5,5,12,9]);   %坐标图的位置和大小
box on;
%% PV f1
figure(1);
hold on; 
plot(PVGBOPIDf1,'color',[0.85 0.325 0.098],'LineStyle',':'); 
plot(PVPSOFOPIDf1,'color',[0.494 0.184 0.556],'LineStyle','-.');  %
plot(PVMDVAFOPIDf1,'color',[0.929 0.694 0.125],'LineStyle','--');  
plot(PVWOAFOPIDf1,'color',[0.466 0.674 0.188],'LineStyle','-');  
plot(PVGBOFOPIDf1,'color',[0.301 0.745 0.933],'LineStyle','-');  %RUQL-L
plot(PVIGBOFOPIDf1,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','PSO-FOPID[22]','MDVA-FOPID[20]','WOA-FOPID[19]','GBO-FOPID','EGBO-FOPID');
%为y轴添加标签
ylabel('\Delta\itf_{\rm1}\rm/Hz');
xlabel('\itt\rm/s');
%doc 指定坐标轴刻度值和标签
 %set(gca,'unit','centimeters','position',[5,5,12,9]);   %坐标图的位置和大小
box on;
%% f2
figure(2);
hold on; 
plot(PVGBOPIDf2,'color',[0.85 0.325 0.098],'LineStyle',':'); 
plot(PVPSOFOPIDf2,'color',[0.494 0.184 0.556],'LineStyle','-.');  %
plot(PVMDVAFOPIDf2,'color',[0.929 0.694 0.125],'LineStyle','--');  
plot(PVWOAFOPIDf2,'color',[0.466 0.674 0.188],'LineStyle','-');  
plot(PVGBOFOPIDf2,'color',[0.301 0.745 0.933],'LineStyle','-');  %RUQL-L
plot(PVIGBOFOPIDf2,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','PSO-FOPID[22]','MDVA-FOPID[20]','WOA-FOPID[19]','GBO-FOPID','EGBO-FOPID');
%为y轴添加标签
ylabel('\Delta\itf_{\rm2}\rm/Hz');
xlabel('\itt\rm/s');
%doc 指定坐标轴刻度值和标签
 %set(gca,'unit','centimeters','position',[5,5,12,9]);   %坐标图的位置和大小
box on;
%% P
figure(2);
hold on; 
plot(PVGBOPIDP,'color',[0.85 0.325 0.098],'LineStyle',':'); 
plot(PVPSOFOPIDP,'color',[0.494 0.184 0.556],'LineStyle','-.');  %
plot(PVMDVAFOPIDP,'color',[0.929 0.694 0.125],'LineStyle','--');  
plot(PVWOAFOPIDP,'color',[0.466 0.674 0.188],'LineStyle','-');  
plot(PVGBOFOPIDP,'color',[0.301 0.745 0.933],'LineStyle','-');  %RUQL-L
plot(PVIGBOFOPIDP,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','PSO-FOPID[22]','MDVA-FOPID[20]','WOA-FOPID[19]','GBO-FOPID','EGBO-FOPID');
%为y轴添加标签
ylabel('\Delta\itP_{\rm12}\rm/pu');
xlabel('\itt\rm/s');
%doc 指定坐标轴刻度值和标签
 %set(gca,'unit','centimeters','position',[5,5,12,9]);   %坐标图的位置和大小
box on;
%% 负荷
figure(4);
hold on;
plot(pv,'b','LineStyle','-');    %DQL
plot(WTG,'k','LineStyle','-');
leg = legend('\itP_{PV}','\itP_{WTG}');
% %为y轴添加标签
ylabel('\itP_{PV}、\itP_{WTG}/\rmpu');
xlabel('\itt\rm/s');
%doc 指定坐标轴刻度值和标签 %坐标图的位置和大小
box on;
clear
clc
%% 鲁棒%%f1
subplot(211)
hold on; 
plot(GBOPIDf1_25,'color',[0.85 0.325 0.098],'LineStyle','-.'); 
%plot(WOAFOPIDP_25,'color',[31/255 146/255 139/255],'LineStyle','-.');  %
plot(GBOFOPIDf1_25,'color',[0.301 0.745 0.933],'LineStyle','--');  %RUQL-L
plot(IGBOFOPIDf1_25,'color',[0.635 0.078 0.184]); 
ylabel('\Delta\itf_{\rm1}\rm/Hz');
xlabel('\itt\rm/s');
title('Inertia constant reduced by 25%')
subplot(212)
hold on; 
plot(GBOPIDf1_50,'color',[0.85 0.325 0.098],'LineStyle','-.'); 
%plot(WOAFOPIDP_25,'color',[31/255 146/255 139/255],'LineStyle','-.');  %
plot(GBOFOPIDf1_50,'color',[0.301 0.745 0.933],'LineStyle','--');  %RUQL-L
plot(IGBOFOPIDf1_50,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','GBO-FOPID','EGBO-FOPID');
ylabel('\Delta\itf_{\rm1}\rm/Hz');
xlabel('\itt\rm/s');
title('Inertia constant reduced by 50%')
%% 鲁棒%%f2
subplot(211)
hold on; 
plot(GBOPIDf2_25,'color',[0.85 0.325 0.098],'LineStyle','-.'); 
%plot(WOAFOPIDP_25,'color',[31/255 146/255 139/255],'LineStyle','-.');  %
plot(GBOFOPIDf2_25,'color',[0.301 0.745 0.933],'LineStyle','--');  %RUQL-L
plot(IGBOFOPIDf2_25,'color',[0.635 0.078 0.184]); 
ylabel('\Delta\itf_{\rm2}\rm/Hz');
xlabel('\itt\rm/s');
title('Inertia constant reduced by 25%')
subplot(212)
hold on; 
plot(GBOPIDf2_50,'color',[0.85 0.325 0.098],'LineStyle','-.'); 
%plot(WOAFOPIDP_25,'color',[31/255 146/255 139/255],'LineStyle','-.');  %
plot(GBOFOPIDf2_50,'color',[0.301 0.745 0.933],'LineStyle','--');  %RUQL-L
plot(IGBOFOPIDf2_50,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','GBO-FOPID','EGBO-FOPID');
ylabel('\Delta\itf_{\rm2}\rm/Hz');
xlabel('\itt\rm/s');
title('Inertia constant reduced by 50%')
%% 鲁棒%%P
subplot(211)
hold on; 
plot(GBOPIDP_25,'color',[0.85 0.325 0.098],'LineStyle','-.'); 
%plot(WOAFOPIDP_25,'color',[31/255 146/255 139/255],'LineStyle','-.');  %
plot(GBOFOPIDP_25,'color',[0.301 0.745 0.933],'LineStyle','--');  %RUQL-L
plot(IGBOFOPIDP_25,'color',[0.635 0.078 0.184]); 
ylabel('\Delta\itP_{\rmtie12}\rm/puMW');
xlabel('\itt\rm/s');
title('Inertia constant reduced by 25%')
subplot(212)
hold on; 
plot(GBOPIDP_50,'color',[0.85 0.325 0.098],'LineStyle','-.'); 
%plot(WOAFOPIDP_25,'color',[31/255 146/255 139/255],'LineStyle','-.');  %
plot(GBOFOPIDP_50,'color',[0.301 0.745 0.933],'LineStyle','--');  %RUQL-L
plot(IGBOFOPIDP_50,'color',[0.635 0.078 0.184]); 
leg = legend('GBO-PID','GBO-FOPID','EGBO-FOPID');
ylabel('\Delta\itP_{\rmtie12}\rm/puMW');
xlabel('\itt\rm/s');
title('Inertia constant reduced by 50%')
%% IGBO
max_value1 = max(PVIGBOFOPIDf1(:)); % 找到矩阵的最大值
min_value1 = min(PVIGBOFOPIDf1(:)); % 找到矩阵的最小值
max_value2 = max(PVIGBOFOPIDf2(:)); % 找到矩阵的最大值
min_value2 = min(PVIGBOFOPIDf2(:)); % 找到矩阵的最小值
max_value3 = max(PVIGBOFOPIDP(:)); % 找到矩阵的最大值
min_value3 = min(PVIGBOFOPIDP(:)); % 找到矩阵的最小值
%% GBO
max_value1 = max(PVGBOFOPIDf1(:)); % 找到矩阵的最大值
min_value1 = min(PVGBOFOPIDf1(:)); % 找到矩阵的最小值
max_value2 = max(PVGBOFOPIDf2(:)); % 找到矩阵的最大值
min_value2 = min(PVGBOFOPIDf2(:)); % 找到矩阵的最小值
max_value3 = max(PVGBOFOPIDP(:)); % 找到矩阵的最大值
min_value3 = min(PVGBOFOPIDP(:)); % 找到矩阵的最小值
%% PSO
max_value1 = max(PVPSOFOPIDf1(:)); % 找到矩阵的最大值
min_value1 = min(PVPSOFOPIDf1(:)); % 找到矩阵的最小值
max_value2 = max(PVPSOFOPIDf2(:)); % 找到矩阵的最大值
min_value2 = min(PVPSOFOPIDf2(:)); % 找到矩阵的最小值
max_value3 = max(PVPSOFOPIDP(:)); % 找到矩阵的最大值
min_value3 = min(PVPSOFOPIDP(:)); % 找到矩阵的最小值
%% WOA
max_value1 = max(PVWOAFOPIDf1(:)); % 找到矩阵的最大值
min_value1 = min(PVWOAFOPIDf1(:)); % 找到矩阵的最小值
max_value2 = max(PVWOAFOPIDf2(:)); % 找到矩阵的最大值
min_value2 = min(PVWOAFOPIDf2(:)); % 找到矩阵的最小值
max_value3 = max(PVWOAFOPIDP(:)); % 找到矩阵的最大值
min_value3 = min(PVWOAFOPIDP(:)); % 找到矩阵的最小值
%% MDVA
max_value1 = max(PVMDVAFOPIDf1(:)); % 找到矩阵的最大值
min_value1 = min(PVMDVAFOPIDf1(:)); % 找到矩阵的最小值
max_value2 = max(PVMDVAFOPIDf2(:)); % 找到矩阵的最大值
min_value2 = min(PVMDVAFOPIDf2(:)); % 找到矩阵的最小值
max_value3 = max(PVMDVAFOPIDP(:)); % 找到矩阵的最大值
min_value3 = min(PVMDVAFOPIDP(:)); % 找到矩阵的最小值
%% PID
max_value1 = max(PVGBOPIDf1(:)); % 找到矩阵的最大值
min_value1 = min(PVGBOPIDf1(:)); % 找到矩阵的最小值
max_value2 = max(PVGBOPIDf2(:)); % 找到矩阵的最大值
min_value2 = min(PVGBOPIDf2(:)); % 找到矩阵的最小值
max_value3 = max(PVGBOPIDP(:)); % 找到矩阵的最大值
min_value3 = min(PVGBOPIDP(:)); % 找到矩阵的最小值








