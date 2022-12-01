clear all
close all

% set parameters
beta = 0.99;
gamma = 0.98;
nu = 0.03;
j = 0.1;
m = 0.89;
eta = 1.01;
Xs = 1.1;
theta = 0.75;
gammae = m*beta + (1-m)*gamma;
kappa = (1-theta)*(1-theta*beta)/theta;

% solve for steady state stuff:
qhY = (gamma*nu/(1-gammae))*(1/Xs);
bY = (beta*m*gamma*nu/(1-gammae))*(1/Xs);
cY = (nu/Xs)*((1-m*beta)*(1-gamma)/(1-gammae));
cpY = 1 - cY;
hH = (1 + (j/(1-beta))*cpY/qhY)^(-1);
hpH = 1 - hH;
hhp = hH/hpH;
iota = (1-beta)*hhp;

% steady state of non-linear model
Ys = 1; % normalization
Hs = 1; % normalization
bs = bY*Ys;
cs = cY*Ys;
cps = cpY*Ys;
hs = hH*Hs;
hps = hpH*Hs;
Ls = (((1-nu)/(Xs))/cpY)^(1/eta);
As = 1/(hs^(nu)*Ls^(1-nu));
ws = ((1-nu)/Xs)*(Ys/Ls);
lams = beta/cs - gamma/cs;
qs = qhY/(hs*Ys);

% other parameters
epsi = Xs/(Xs-1);
rrb = (1/beta); % gross nominal rate
% Taylor rule and shock
rY = 0;
rpi = 0.27;
rR = 0.73;
sR = 0.29;

save iaco_param_base_nonlin beta gamma nu j m eta Xs theta gammae kappa qhY bY cY cpY hH rY rpi rR sR iota epsi rrb As Ys Hs hs hps bs cs cps Ls rrb ws lams qs

dynare iacoviello_2005_base_nonlin noclearall nolog

% save IRFs
IRFB = [lR_eR lY_eR lpi_eR lq_eR];

figure
plot(llam_eR,'-k','Linewidth',2)
title('\lambda')

subplot(2,2,1)
plot(lR_eR,'-k','Linewidth',2)
title('norminal interst rate')

subplot(2,2,2)
plot(lY_eR,'-k','Linewidth',2)
title('output')
subplot(2,2,3)
plot(lpi_eR,'-k','Linewidth',2)
title('\pi')
subplot(2,2,4)
plot(lq_eR,'-k','Linewidth',2)
title('House price')
