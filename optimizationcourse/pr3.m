f1= -1*[3 3.4]'
A = [
  [ 0.3 0.38];
  [ 3  4];
  [ -1 0];
  [0 -1];
]
b = [ 4000 20000 0 0]'

x=linprog(f1,A,b)
