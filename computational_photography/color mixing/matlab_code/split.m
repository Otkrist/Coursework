function [I1,I2,I3] = split(A1)

dimensions =  size(A1) ;
m = dimensions(1)
n = dimensions(2)
c = dimensions(3)


I1 = zeros(m,n,c);
I2 = zeros(m,n,c);
I3 = zeros(m,n,c);

for i = 1:m,
    for j=1:n,
        I1(i,j,1) = A1(i,j,1);
        I2(i,j,2) = A1(i,j,2);
        I3(i,j,3) = A1(i,j,3);
    end
end

end
