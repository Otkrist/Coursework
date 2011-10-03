function [A b c]=getChebyShev(f1,d,r)
% give me function and degree, range and N
% I give you linear programming back


N = size(r,1);
A = zeros(2*N,2*N+2*N+2+2*d+2);

c = zeros(size(A,2),1);
c(end) = -1;
c(end-1) = 1;

b= zeros(size(A,1),1);

for i=1:N,
  xi = r(i);
  fi = f1(i);

  % power for x %
  xp = 1;
  for j=0:d,
    A(i,2*j+1) = xp;
    A(i,2*j+2) = -1*xp;
    xp = xp*xi;
  end

  A(i,2*d+2+2*i-1)=-1;
  A(i,2*d+2+2*i) =1;
 
  b(N+2*i-1) = fi;
  b(N+2*i) = fi;

 
  A(i+N,2*d+2+2*i-1)=1;
  A(i+N,2*d+2+2*i) =-1;
  A(i+N,2*d+2+2*N+i)=1;

  A(i+2*N,2*d+2+2*i-1)=1;
  A(i+2*N,2*d+2+2*i) =-1;
  A(i+2*N,2*d+2+3*N+i)=-1;

end

A(N+1:end,end-1)=-1;
A(N+1:end,end)=1;
