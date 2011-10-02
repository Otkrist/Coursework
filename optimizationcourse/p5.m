b=[1 1 4]'
c=[0 0 -1 1 0 0 0]
A = [[1 -1 1 -1 1 0 0 ];
    [1 -1 0 0 0 1 0];
    [2 2 1 -1 0 0 1]
]


simplesimplex(c,A,b,[5 6 7])
%[x1,f1,exitflag,output] =linprog(c,-eye(7,7),zeros(1,7),A,b)


return
B=[[1 0 0];[0 1 0];[1 0 1]];
inv(B)
x=inv(B)*b
A1 = inv(B)*A
cb = [-1 0 0]
c1 = c-cb*inv(B)*A

B=[[-1 0 0];[-1 1 0];[2 0 1]]
inv(B)
x = inv(B)*b
A1 = inv(B)*A
cb = [0 0 0]
c1 = c-cb*inv(B)*A

B=[[1 0 1];[ 0  1 0];[0 0 1]];
inv(B)
x = inv(B)*b
A1 = inv(B)*A
cb=[-1 0 0]
c1 = c-cb*inv(B)*A

