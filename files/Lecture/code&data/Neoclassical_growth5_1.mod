var Y C I K N;
varexo A; 
parameters alpha beta delta theta;

alpha = 0.58;
beta = 0.988;
delta = 0.025;
theta = 4 *( alpha * (1 - beta ) + alpha * beta * delta ) / (1 - beta + alpha * beta * delta );
%A = (( beta * (1 - alpha )) / (1 + beta * ( delta - 1)))^( alpha - 1) * 0.2^( - alpha );

model;
# u_c = 1 / C;
# u_l = theta / (1 - N);
# u_c1 = 1 / C (+1) ;
# F = A * K( -1) ^(1 - alpha ) * N^ alpha ;
# F_n = alpha * F / N;
# F1 = A * K^(1 - alpha ) * N (+1) ^ alpha ;
# F_k1 = (1 - alpha ) * F1 / K;

[name = 'Production Function']
Y = F;
[name = 'Capital Accumulation']
K = I + (1 - delta ) * K( -1);
[ name = 'Resource Constraint']
C + I = Y;
[ name = 'Euler Equation1']
u_c = beta*u_c1*( F_k1+1-delta);
[name = 'Euler Equation2']
u_l = u_c*F_n;
end;

%% step2 after adding 
% 本模型只有一个稳态，若模型存在多个稳态，求得的稳态是距初值最“近”的那个。
% initval;
% Y = 1;
% C = 0.5;
% I = 0.5;
% K = 11;
% N = 0.2;
% end;
% steady;
%% 求任意演化路径

% initval;
% K = 11;
% end;
% endval;
% C = 0.5;
% N = 0.2;
% end;
% perfect_foresight_setup (periods =200);
% perfect_foresight_solver;
% ========================================================================
% 求演化路径时只需提供特定变量的初值和终值（其他变量提供初终值也无影响）。
% 后向变量（含(-1)项）需要提供初值，前向变量（含(+1)项）需要提供终值。
%% 求内生变量微小变化的演化路径（求得稳态后）
% initval;
% Y = 1;
% C = 0.5;
% I = 0.5;
% K = 11;
% N = 0.2;
% end;
% steady;
% 
% ss = oo_.steady_state;
% histval;
% K(0) = 0.99*ss(4);
% end;
% 
% perfect_foresight_setup(periods =200);
% perfect_foresight_solver;
% ====================================================================================
% 求得稳态后模拟路径的初终值均会设置为稳态，此时将K的历史值（也即初值）设置为稳态的99%，
% 即可以模拟K的变动对模型的影响。
% =====================================================================================
%% 求从一个稳态到另一个稳态的演化路径（需先将A外生化）有错误
% 给定不同的外生变量值，求模型从一个稳态到另一个稳态的演化路径。
% A增加10%的变化
% ==================================================
% notes：将A外生化，并将parameters部分A注掉
% ===================================================
% initval;
% Y = 1;
% C = 0.5;
% I = 0.5;
% K = 11;
% N = 0.2;
% A = 1;
% end;
% steady;
% 
% endval;
% Y = 1;
% C = 0.5;
% I = 0.5;
% K = 11;
% N = 0.2;
% A = 1.1;
% end;
% steady;
% 
% perfect_foresight_setup( periods =200);
% perfect_foresight_solver;

%% 求外生变量扰动后的变化路径（需先将A外生化）
initval;
Y = 1;
C = 0.5;
I = 0.5;
K = 11;
N = 0.2;
A = 1;
end;

steady;

shocks;
var A;
periods 1;
values 1.1;
end;
perfect_foresight_setup ( periods =200);
perfect_foresight_solver;
%===================================================================================
% 观察运行后的oo .exo simul变量，可以发现该变量只有第一期时值为1.1，其他时期值均为1，
% 这也是确定性模拟区别于随机性模拟的地方。
%===================================================================================
%% 随机模型（比较接近RBC）
% 对于随机性模型，主要研究的是在外生变量的随机扰动下，内生变量的
% 演化路径，这可以通过修改shocks模块来实现：
% initval;
% Y = 1;
% C = 0.5;
% I = 0.5;
% K = 11;
% N = 0.2;
% A = 1;
% end;
% steady;
% 
% shocks;
% var A;stderr 0.01;
% end;
% stoch_simul ( periods = 200);
% 观察运行后的oo .exo simul变量，并与确定性模拟的扰动进行比较，可以对随机性的体现有进一步的理解。