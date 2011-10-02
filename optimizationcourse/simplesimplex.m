function simplex(c,Aeq,beq,Bi)

A=Aeq;
b=beq;

for i=1:3,
    Bi
    

    B = A(:,Bi)
    cb = c(Bi)
    A1 = inv(B)*A
    x1 = inv(B)*b
    c1 = c - cb*inv(B)*A

    
    j=1;
    while c1(j)>=0
      j=j+1;
    end

    j
    u = A1(:,j)

    minthetaind = 0;
    minthetaval = 1e10;
    for l=1:size(x1,1),
      if(u(l) > (0+eps))
        theta = x1(l)/u(l);
        if(theta<minthetaval)
          minthetaind = l;
          minthetaval = theta;
        end
      end
    end

    l=minthetaind

    Bi(l) = j; 

end
