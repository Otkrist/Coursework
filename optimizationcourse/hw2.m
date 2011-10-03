clear all
close all
%c=[-2 -1 0 0]
%b=[2 6]'
%A = [[1 -1 1 0 ];
%      [1 1 0 1];
%]
%simplesimplex_succint(c,A,b,[3 4])

N = 100;
d = 3;
a = -1;
b = 1;


r = linspace(a,b,N)';
f1 = exp(r);

[A b c] =getChebyShev(f1,d,r);
size(A)

% A x = b
% minimize ( c . x )
%[p fval]=linprog(-b,A',c);
N=size(A,2);
[x,fval] = linprog(c,-eye(N,N),zeros(N,1),A,b);

