function [residual, g1, g2, g3] = homework_2_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
T30 = y(1)/y(7);
T32 = (1-params(4))*T30^params(4);
T35 = exp(y(10))^(1-params(4));
T73 = getPowerDeriv(T30,params(4),1);
lhs =params(2)*y(4)/(1-y(7));
rhs =y(8);
residual(1)= lhs-rhs;
lhs =1/y(4);
rhs =params(1)*1/y(11)*(1+y(12)-params(3));
residual(2)= lhs-rhs;
lhs =y(8);
rhs =T32*T35;
residual(3)= lhs-rhs;
lhs =y(9);
rhs =T35*params(4)*T30^(params(4)-1);
residual(4)= lhs-rhs;
lhs =y(4)+y(6);
rhs =y(3);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(6)+y(1)*(1-params(3));
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(1)^params(4)*(y(7)*exp(y(10)))^(1-params(4));
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(5)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

  g1(1,4)=params(2)/(1-y(7));
  g1(1,7)=params(2)*y(4)/((1-y(7))*(1-y(7)));
  g1(1,8)=(-1);
  g1(2,4)=(-1)/(y(4)*y(4));
  g1(2,11)=(-((1+y(12)-params(3))*params(1)*(-1)/(y(11)*y(11))));
  g1(2,12)=(-(params(1)*1/y(11)));
  g1(3,1)=(-(T35*(1-params(4))*1/y(7)*T73));
  g1(3,7)=(-(T35*(1-params(4))*T73*(-y(1))/(y(7)*y(7))));
  g1(3,8)=1;
  g1(3,10)=(-(T32*exp(y(10))*getPowerDeriv(exp(y(10)),1-params(4),1)));
  g1(4,1)=(-(T35*params(4)*1/y(7)*getPowerDeriv(T30,params(4)-1,1)));
  g1(4,7)=(-(T35*params(4)*getPowerDeriv(T30,params(4)-1,1)*(-y(1))/(y(7)*y(7))));
  g1(4,9)=1;
  g1(4,10)=(-(params(4)*T30^(params(4)-1)*exp(y(10))*getPowerDeriv(exp(y(10)),1-params(4),1)));
  g1(5,3)=(-1);
  g1(5,4)=1;
  g1(5,6)=1;
  g1(6,1)=(-(1-params(3)));
  g1(6,5)=1;
  g1(6,6)=(-1);
  g1(7,3)=1;
  g1(7,1)=(-((y(7)*exp(y(10)))^(1-params(4))*getPowerDeriv(y(1),params(4),1)));
  g1(7,7)=(-(y(1)^params(4)*exp(y(10))*getPowerDeriv(y(7)*exp(y(10)),1-params(4),1)));
  g1(7,10)=(-(y(1)^params(4)*y(7)*exp(y(10))*getPowerDeriv(y(7)*exp(y(10)),1-params(4),1)));
  g1(8,2)=(-params(5));
  g1(8,10)=1;
  g1(8,13)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,169);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,2197);
end
end
