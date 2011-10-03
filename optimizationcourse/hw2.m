clear all
close all
%c=[-2 -1 0 0]
%b=[2 6]'
%A = [[1 -1 1 0 ];
%      [1 1 0 1];
%]
%simplesimplex_succint(c,A,b,[3 4])

funct = {}


N = 100;
a = -1;
b = 1;
r = linspace(a,b,N)';
f1 = exp(r);

figure;
hold on;
plot(r,f1,'b');

% For each degree try out function %
for deg=0:5,
d = deg;

[A b c] =getChebyShev(f1,d,r);
size(A)

% A x = b
% minimize ( c . x )
%[p fval]=linprog(-b,A',c);
N=size(A,2);
[x,fval] = linprog(c,-eye(N,N),zeros(N,1),A,b);

poly = zeros(d+1,1);
polynomial_s = '0';
for j=1:d+1
  poly(j) =  x(2*j-1) - x(2*j);
  polynomial_s = [polynomial_s '+%ft^' sprintf('%d',j-1) ];
end

polynomial_s;
polynomial_s = sprintf(polynomial_s,poly)
f_sol = inline(polynomial_s)
funct{deg+1} = f_sol

v1 = f_sol(r);
plot(r,v1,'r');
end
