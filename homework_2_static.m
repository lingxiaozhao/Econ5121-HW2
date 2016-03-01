function [residual, g1, g2] = homework_2_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

T28 = y(3)/y(5);
T30 = (1-params(4))*T28^params(4);
T33 = exp(y(8))^(1-params(4));
T66 = getPowerDeriv(T28,params(4),1);
lhs =params(2)*y(2)/(1-y(5));
rhs =y(6);
residual(1)= lhs-rhs;
lhs =1/y(2);
rhs =1/y(2)*params(1)*(1+y(7)-params(3));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =T30*T33;
residual(3)= lhs-rhs;
lhs =y(7);
rhs =T33*params(4)*T28^(params(4)-1);
residual(4)= lhs-rhs;
lhs =y(2)+y(4);
rhs =y(1);
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(4)+y(3)*(1-params(3));
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(3)^params(4)*(y(5)*exp(y(8)))^(1-params(4));
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(5)+x(1);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,2)=params(2)/(1-y(5));
  g1(1,5)=params(2)*y(2)/((1-y(5))*(1-y(5)));
  g1(1,6)=(-1);
  g1(2,2)=(-1)/(y(2)*y(2))-(1+y(7)-params(3))*params(1)*(-1)/(y(2)*y(2));
  g1(2,7)=(-(1/y(2)*params(1)));
  g1(3,3)=(-(T33*(1-params(4))*1/y(5)*T66));
  g1(3,5)=(-(T33*(1-params(4))*T66*(-y(3))/(y(5)*y(5))));
  g1(3,6)=1;
  g1(3,8)=(-(T30*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(4),1)));
  g1(4,3)=(-(T33*params(4)*1/y(5)*getPowerDeriv(T28,params(4)-1,1)));
  g1(4,5)=(-(T33*params(4)*getPowerDeriv(T28,params(4)-1,1)*(-y(3))/(y(5)*y(5))));
  g1(4,7)=1;
  g1(4,8)=(-(params(4)*T28^(params(4)-1)*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(4),1)));
  g1(5,1)=(-1);
  g1(5,2)=1;
  g1(5,4)=1;
  g1(6,3)=1-(1-params(3));
  g1(6,4)=(-1);
  g1(7,1)=1;
  g1(7,3)=(-((y(5)*exp(y(8)))^(1-params(4))*getPowerDeriv(y(3),params(4),1)));
  g1(7,5)=(-(y(3)^params(4)*exp(y(8))*getPowerDeriv(y(5)*exp(y(8)),1-params(4),1)));
  g1(7,8)=(-(y(3)^params(4)*y(5)*exp(y(8))*getPowerDeriv(y(5)*exp(y(8)),1-params(4),1)));
  g1(8,8)=1-params(5);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
end
end
