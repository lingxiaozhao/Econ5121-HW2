% Lingxiao Zhao 
% Homework 2
% Simple RBC model with labor shock

% Part1: This part calculates the steady state of the model by using conventional parameters
% Define endogenous variables
var y c k i n w r x;
% Define exogenous variables
varexo e_x;
% Define parameters  
parameters beta psi delta theta rho_x sigma_x;
% Parameters
beta=0.99;
psi=1.75;
delta=0.025;
theta=0.333;
rho_x=0.95;
sigma_x=0.01;

% Declare the model
model;
psi*c/(1-n) = w;
(1/c) = beta*(1/c(+1))*(r(+1)+1-delta);
w = (1-theta)*(k(-1)/n)^(theta)*(exp(x)^(1-theta));
r = theta*(k(-1)/n)^(theta-1)*(exp(x)^(1-theta));
c + i = y;
k = (1-delta)*k(-1) + i;
y = k(-1)^(theta)*(exp(x)*n)^(1-theta);
x = rho_x*x(-1)+e_x;
end;

% Initial Value 
% I have used another matlab code to solve the steady state for easier calculation
initval;
k=9.7191;
n=0.3332;
y=1.0245;
c=0.7815;
i=0.2430;
w=2.0510;
r=0.0351;
x=0;
end;

% Declare the shocks
shocks;
var e_x = sigma_x^2;
end;

steady;
check;
stoch_simul(hp_filter=1600,order=1,irf=40);

% Part2: Estimate parameters
% Estimate parameters using conventional prior distributions
estimated_params;
theta,beta_pdf,0.35,0.02;
beta,beta_pdf,0.99,0.002;
delta,beta_pdf,0.025,0.003;
psi,gamma_pdf,1.75,0.01;
rho_x,beta_pdf,0.95,0.05;
stderr e_x, inv_gamma_pdf, 0.01, inf; 
end;

% Declare observable variables
varobs y;

estimation(datafile=homework2,plot_priors=0,mh_replic=1200,mh_nblocks=5,mh_jscale=0.8);