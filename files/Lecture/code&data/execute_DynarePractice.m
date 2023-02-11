clear all;
close all;
clc
%Change directory in matlab
cd C:\Users\zongh\Seafile\私人资料库\Lecture
%add dynare path to matlab
addpath W:\software\Matlab\5.2.0\matlab
%4.6.0 is the version number, please check your own version
%Create a dynare code, save as xxx.mod in the working directory. For example, I have a dynare code saved as RBC_shen.mod
%Execute the dynare code
%% dynare只能用于求解DSGE吗？NO
% DGE新古典增长模型
dynare Neoclassical_growth
dynare Neoclassical_growth2
dynare Neoclassical_growth3
dynare Neoclassical_growth4
dynare Neoclassical_growth5_1
dynare Neoclassical_growth5_2
%% RBC
dynare RBC

subplot(3,3,1);
plot(Y);
subplot(3,3,2);
plot(C); 
subplot(3,3,3);
plot(I); 
subplot(3,3,4);
plot(K); 
subplot(3,3,5);
plot(L); 
subplot(3,3,6);
plot(W); 
subplot(3,3,7);
plot(R);
subplot(3,3,8);
plot(A);
subplot(3,3,9);
plot(oo_.exo_simul(:,1));

%设置资本产出弹性的不同数值传递参数
alpha_s=[0.3,0.4,0.5]

IRF_save=zeros(length(alpha_s),40,7);
for i=1:length(alpha_s)
    alpha=alpha_s(i);
    save parafile alpha;
    dynare RBC.mod noclearall nograph;
    %Y C I K L W R A 
    IRF_save(i,:,1)=oo_.irfs.Y_e;
    IRF_save(i,:,2)=oo_.irfs.C_e;
    IRF_save(i,:,3)=oo_.irfs.I_e;
    IRF_save(i,:,4)=oo_.irfs.K_e;
    IRF_save(i,:,5)=oo_.irfs.L_e;
    IRF_save(i,:,6)=oo_.irfs.W_e;
    IRF_save(i,:,7)=oo_.irfs.R_e;
end

t=1:40;
base=zeros(1,40);
subplot(3,3,1);
plot(t,IRF_save(1,:,1),'g-',t,IRF_save(2,:,1),'b--',t,IRF_save(3,:,1),'k-',t,base,'r-');
legend("\alpha=0.3",'\alpha=0.4','\alpha=0.5')
title('Y');
subplot(3,3,2);
plot(t,IRF_save(1,:,2),'g-',t,IRF_save(2,:,2),'b--',t,IRF_save(3,:,2),'k-',t,base,'r-');
title('C');
subplot(3,3,3);
plot(t,IRF_save(1,:,3),'g-',t,IRF_save(2,:,3),'b--',t,IRF_save(3,:,3),'k-',t,base,'r-');
title('I');
subplot(3,3,4);
plot(t,IRF_save(1,:,4),'g-',t,IRF_save(2,:,4),'b--',t,IRF_save(3,:,4),'k-',t,base,'r-');
title('K');
subplot(3,3,5);
plot(t,IRF_save(1,:,5),'g-',t,IRF_save(2,:,5),'b--',t,IRF_save(3,:,5),'k-',t,base,'r-');
title('L');
subplot(3,3,6);
plot(t,IRF_save(1,:,6),'g-',t,IRF_save(2,:,6),'b--',t,IRF_save(3,:,6),'k-',t,base,'r-');
title('W');
subplot(3,3,7);
plot(t,IRF_save(1,:,7),'g-',t,IRF_save(2,:,7),'b--',t,IRF_save(3,:,7),'k-',t,base,'r-');
title('R');
 