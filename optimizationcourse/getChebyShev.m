function [A b c]=getChebyShev(f1,d,r)
% give me function(value of function at N points) and degree, range( bunch of xi corresponding to function)
% I give you linear programming back
% the first 2*d values in solution of min c.x, A*x = b are the coefficients of polynomial approximation


N = size(r,1);
A = zeros(2*N,2*N+2*d+4);

c = zeros(size(A,2),1);
c(end-1) = 1;
c(end) = -1;

b= zeros(size(A,1),1);

for i=0:N-1,
  xi = r(i+1);
  fi = f1(i+1);

  i1 = 2*i+1;
  i2 = 2*i+2;

  % power for x %
  xp = 1;
  for j=0:d,
    A(i1,2*j+1) = xp;
    A(i1,2*j+2) = -1*xp;
    A(i2,2*j+1) = xp;
    A(i2,2*j+2) = -1*xp;
    xp = xp*xi;
  end

  A(i1,2*d+3+i) = 1;
  A(i2,2*d+N+3+i) = -1;

  A(i1,end-1) = -1;
  A(i1,end) = 1;
  A(i2,end-1) = 1;
  A(i2,end) = -1;

 
  b(i1) = fi;
  b(i2) = fi;
end
