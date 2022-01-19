function [dq,dqd,dqdd]=readTraj(name,Ts,Cuatro)

%Cuatro = 16;
%Ts = 1e-3;
%name='Rectangle';


m = readmatrix([name '.txt']);
i=1:2:size(m,1)-1; %%%%%
pos=m(i,:);
pos=pos(:,~isnan(sum(pos,1)));
i=2:2:size(m,1)-1; %%%%%
T=m(i,:);
T=T(:,sum(T,1)>0);

pos=pos(:,1:size(T,2)+1);
totalTime=sum(T,2);
T=Cuatro*T/totalTime(1);
[Qcoef,time1,dq,dqd,dqdd]=pol5(pos,pos*0,pos*0,0,T,Ts);
if size(dq,2)==8
    q0=dq(1,2:8);
    save(['trajectories/' name '.mat'],'dq','dqd','dqdd','q0')
end
end