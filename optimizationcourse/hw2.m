clear all
close all

%% Problem 1
%c=[-2 -1 0 0]
%b=[2 6]'
%A = [[1 -1 1 0 ];
%      [1 1 0 1];
%]
%simplesimplex_succint(c,A,b,[3 4])



%% Problem 2
N = 100;
a = -1;
b = 1;
r = linspace(a,b,N)';
f1 = exp(r);
soln_err = [];
v={};

% For each degree try out function %
for deg=0:5,
d = deg;

[A b c] =getChebyShev(f1,d,r);

% A x = b
% minimize ( c . x )
%[p fval]=linprog(-b,A',c);
N=size(A,2);
[x,fval] = linprog(c,-eye(N,N),zeros(N,1),A,b);

poly = zeros(d+1,1);
for j=1:d+1
  poly(j) =  x(2*j-1) - x(2*j);
end

v{deg+1} = polyval(poly(end:-1:1),r);
soln_err = [soln_err x(end-1)-x(end)];


taylor_poly = [1,1,1.0/2,1.0/6,1.0/24,1.0/120];
tayl{deg+1} = polyval(taylor_poly((deg+1):-1:1),r);

figure;
plot(r,f1,r,v{deg+1},r,tayl{deg+1});
legend('e^x','cheby shev','taylor');
title(sprintf('Comparison plot degree %d',deg))
saveas(gcf,sprintf('Chebyshevvstaylordeg%d.png',deg));
end

figure;
plot(r,f1,r,v{1},r,v{2},r,v{3},r,v{4},r,v{5},r,v{6})
legend('e^x','deg 0','deg 1','deg 2','deg 3','deg 4','deg 5')
title('Function plots')
saveas(gcf,'Solutionplots.png')


figure
plot([0:5],soln_err);
title('Solution Error');
saveas(gcf,'SolutionError.png')

