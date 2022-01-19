close all

disp('graficando...')
nn=size(r.q,2);

Ts=1e-3;
tiempo=0:Ts:(size(r.q,1)-1)*Ts;

if nn==7
    yt=4;
    xt=2;
else
    yt=grados;
    xt=1;
end

yM=2;
%FontSize
LFS=9; %legend
XFS=13; %xlabel
YFS=15; %ylabel
ZFS=15; %zlabel
GS='on'; %GraphicsSmoothing
SF1=3*2; %SIZE FIGURE
SF2=4.2288*2; %SIZE FIGURE
TAS=12; %tick axis size
TXS=8; %text size
LWS=1; %line Width
num=1000;
if size(r.q,1)<num
    num=size(r.q,1);
end
RE=1:round(size(r.q,1)/num):size(r.q,1);
%get(groot, 'default')
set(groot,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');


% TRACKING ERROR
figure('Name','trackingError','NumberTitle','off','units','inches','outerposition',[0 0 SF1 SF2],'GraphicsSmoothing',GS)
for i=1:nn
    subplot(yt,xt,i)
    plot(tiempo(RE),(r.dq(RE,i)-r.q(RE,i))*180/pi,'b','LineWidth',LWS)
    set(gca,'FontSize',TAS)
    limite=ylim; cent=mean(limite); rang=yM*(limite(2)-limite(1))/2; limite(1)=cent-rang; limite(2)=cent+rang; ylim(limite);
    xlim([0 tiempo(RE(end))])
    xlabel('Time (sec)','FontSize',XFS)
    ylabel(['$e_{\theta' num2str(i) '}$ (deg)'],'FontSize',YFS)
end
drawnow

%CONTROL SIGNAL
figure('Name','Torque','NumberTitle','off','units','inches','outerposition',[0 0 SF1 SF2],'GraphicsSmoothing',GS)
for i=1:nn
    subplot(yt,xt,i)
    plot(tiempo(RE),r.torque(RE,i),'b','LineWidth',LWS)
    set(gca,'FontSize',TAS)
    limite=ylim; cent=mean(limite); rang=yM*(limite(2)-limite(1))/2; limite(1)=cent-rang; limite(2)=cent+rang; ylim(limite);
    xlim([0 tiempo(RE(end))])
    xlabel('Time (sec)','FontSize',XFS)
    ylabel(['$\Gamma_' num2str(i) '$(Nm)'],'FontSize',YFS)
end
%sgtitle('Control signal','FontSize',SFS)
drawnow

%TRAJECTORY TRACKING
figure('Name','trajectoryTracking','NumberTitle','off','units','inches','outerposition',[0 0 SF1 SF2],'GraphicsSmoothing',GS)
for i=1:nn
    subplot(yt,xt,i)
    plot(tiempo(RE),r.dq(RE,i)*180/pi,'b','LineWidth',LWS)
    hold on
    plot(tiempo(RE),r.q(RE,i)*180/pi,'r--','LineWidth',LWS)
    set(gca,'FontSize',TAS)
    limite=ylim; cent=mean(limite); rang=yM*(limite(2)-limite(1))/2; limite(1)=cent-rang; limite(2)=cent+rang; ylim(limite);
    xlim([0 tiempo(RE(end))])
    legend('Reference','Measured','FontSize',LFS,'Location','best')
    legend('boxoff')
    xlabel('Time (sec)','FontSize',XFS)
    ylabel(['$\theta_' num2str(i) '$(deg)'],'FontSize',YFS)
end
drawnow
%sgtitle('Trajectory tracking','FontSize',SFS)
% CARTESIAN PLOT
if nn==7
x1=[]; y1=[]; z1=[];
x2=[]; y2=[]; z2=[];
metros=100;
[J,R,P] = matricesJRP;
RE=1:round(size(r.q,1)/100):size(r.q,1);
for i=RE
 q=r.q(i,:); q1=q(1); q2=q(2); q3=q(3); q4=q(4);
 pos = double(subs(P));
 
 x1=[x1 pos(1)*metros];
 y1=[y1 pos(2)*metros];
 z1=[z1 pos(3)*metros];

 q=r.dq(i,:); q1=q(1); q2=q(2); q3=q(3); q4=q(4);
 pos = double(subs(P));
 x2=[x2 pos(1)*metros];
 y2=[y2 pos(2)*metros];
 z2=[z2 pos(3)*metros];
 
end

figure('Name','cartesianTracking','NumberTitle','off','units','inches','outerposition',[0 0 SF1 SF2],'GraphicsSmoothing',GS)

subplot(2,1,1)
plot3(x2,y2,z2,'-','LineWidth',LWS,'Color','b');
hold on
plot3(x1,y1,z1,'--','LineWidth',LWS,'Color','r');
set(gca,'FontSize',TAS)
xlabel('X (cm)','FontSize',XFS);
ylabel('Y (cm)','FontSize',YFS);
zlabel('Z (cm)','FontSize',ZFS);
legend('Desired','Actual','FontSize',LFS,'Location','best')
legend('boxoff')
set(gca, 'Zdir', 'reverse')
set(gca, 'Ydir', 'reverse')
text(x1(1)+0.1,y1(1),z1(1)+0*0.6,'$\uparrow$ Starting position','FontSize',TXS)
text(x2(1)+0.1,y2(1),z2(1)-0*0.6,'$\downarrow$ Starting trajectory','FontSize',TXS)
%axis('equal')

d =  sqrt(  (x2 - x1).^2 + (y2 - y1).^2 + (z2 - z1).^2 );
subplot(2,1,2)
plot(tiempo(RE),d,'LineWidth',LWS,'Color','b');
set(gca,'FontSize',TAS)
limite=ylim; cent=mean(limite); rang=yM*(limite(2)-limite(1))/2; limite(1)=cent-rang; limite(2)=cent+rang; ylim(limite);
xlim([0 tiempo(RE(end))])
ylabel('Cartesian error (cm)','FontSize',YFS);
xlabel('Time (sec)','FontSize',XFS);
end
drawnow