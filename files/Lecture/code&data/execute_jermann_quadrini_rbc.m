clear all
close all

% set parameters
beta = 0.9825;
theta = 0.36;
delta = 0.025;
tau = 0.35;
xis = 0.1634;
alpha = 1.8834;
kappa = 0.1460;
%kappa = 0;
rhox = 0.95;
rhoz = 0.95;
sx = 1;
sz = 1;

% solve for steady state
rs = 1/beta - 1;
Rs = 1 + rs*(1-tau);
mus = (1 - beta*Rs)*(1+rs)/(xis*Rs);
kns = (theta*(1-mus)/((1-mus*xis)/beta - (1-delta)))^(1/(1-theta));
ws = (1-mus)*(1-theta)*kns^(theta);
cns = kns^(theta) - delta*kns;
ns = (1 + alpha*cns/ws)^(-1);
ks = kns*ns;
cs = cns*ns;
ys = ks^(theta)*ns^(1-theta);
is = delta*ks;
bs = (1+rs)*(ks - ys/xis);
ds = ys - ws*ns - is -bs + bs/Rs;
Ts = bs*(1/Rs - 1/(1+rs));
us = (1/(1-beta))*(log(cs) + alpha*log(1-ns));

save param_jq alpha beta theta delta tau xis kappa sz sx rhox rhoz rs Rs mus ws ns ks cs ys is bs ds Ts

dynare jermann_quadrini_rbc noclearall nolog

X0 = [logy_ez logc_ez logi_ez logn_ez mu_ez];
X00 = [logy_ex logc_ex logi_ex logn_ex mu_ex];
nn = size(logy_ez,1);

t = 1:nn;

figure
plot(t,p_ez,'-k',t,p_ex,':b','Linewidth',1.5)
title('Share Price')
legend('Productivity Shock','Financial Shock')

figure
plot(t,eterm_ez,'-k',t,eterm_ex,':b','Linewidth',1.5)
title('V/(K-B)')
legend('Productivity Shock','Financial Shock')

% now do frictionless version
rs = 1/beta - 1;
Rs = 1 + rs;
mus = 0;
kns = (theta*(1-mus)/((1-mus*xis)/beta - (1-delta)))^(1/(1-theta));
ws2 = (1-mus)*(1-theta)*kns^(theta);
cns = kns^(theta) - delta*kns;
ns2 = (1 + alpha*cns/ws)^(-1);
ks2 = kns*ns2;
cs2 = cns*ns2;
ys2 = ks2^(theta)*ns2^(1-theta);
is2 = delta*ks2;
us2 = (1/(1-beta))*(log(cs2) + alpha*log(1-ns2));

save param_jq alpha beta theta delta tau xis kappa sz sx rhox rhoz rs Rs mus ws2 ns2 ks2 cs2 ys2 is2 bs ds Ts

%dynare jermann_quadrini_rbc_nofric noclearall nolog
dynare jermann_quadrini_rbc noclearall nolog
X1 = [logy_ez logc_ez logi_ez logn_ez zeros(nn,1)];
X11 = zeros(nn,5);

t = 1:nn;

figure
subplot(2,3,1)
plot(t,X0(:,1),'-k',t,X1(:,1),'--k','Linewidth',1.5)
title('y')

subplot(2,3,2)
plot(t,X0(:,2),'-k',t,X1(:,2),'--k','Linewidth',1.5)
title('c')

subplot(2,3,3)
plot(t,X0(:,3),'-k',t,X1(:,3),'--k','Linewidth',1.5)
title('i')

subplot(2,3,4)
plot(t,X0(:,4),'-k',t,X1(:,4),'--k','Linewidth',1.5)
title('n')

subplot(2,3,5)
plot(t,X0(:,5),'-k',t,X1(:,5),'--k','Linewidth',1.5)
title('\mu')
legend('Constrained Model','Unconstrained')

figure
subplot(2,3,1)
plot(t,X00(:,1),'-k',t,X11(:,1),'--k','Linewidth',1.5)
title('y')

subplot(2,3,2)
plot(t,X00(:,2),'-k',t,X11(:,2),'--k','Linewidth',1.5)
title('c')

subplot(2,3,3)
plot(t,X00(:,3),'-k',t,X11(:,3),'--k','Linewidth',1.5)
title('i')

subplot(2,3,4)
plot(t,X00(:,4),'-k',t,X11(:,4),'--k','Linewidth',1.5)
title('n')

subplot(2,3,5)
plot(t,X00(:,5),'-k',t,X11(:,5),'--k','Linewidth',1.5)
title('\mu')
legend('Constrained Model','Unconstrained')