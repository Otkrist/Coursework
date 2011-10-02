function [I] = extension(I1,I2,I3,functor)

dimensions =  size(I1) ;
m = dimensions(1);
n = dimensions(2);
c = dimensions(3);

I = zeros(m,n,c);

for i = 1:m,
    for j=1:n,
      I(i,j,1) = functor([I1(i,j,1),I2(i,j,2),I3(i,j,3)],1);
      I(i,j,2) = functor([I1(i,j,1),I2(i,j,2),I3(i,j,3)],2);
      I(i,j,3) = functor([I1(i,j,1),I2(i,j,2),I3(i,j,3)],3);
  end
end
