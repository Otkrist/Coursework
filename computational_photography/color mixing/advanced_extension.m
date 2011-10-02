function [I] = advanced_extension(I1,I2,I3,functor)

% Function to model the rgb as a 3 x 3 matrix with variuos operations applied to it %

dimensions =  size(I1);
m = dimensions(1);
n = dimensions(2);
c = dimensions(3);

I = zeros(m,n,c);

for i = 1:m,
    if (mod(i,10)==0),
      fprintf('.')
    end
    for j=1:n,
      I(i,j,:) = abs(functor(squeeze(I1(i,j,:)),squeeze(I2(i,j,:)),squeeze(I3(i,j,:))));
  end
end
