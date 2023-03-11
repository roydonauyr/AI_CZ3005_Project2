competitor(appy, sumsum).
competitor(sumsum, appy).
product(galacticaS3, sumsum).
boss(stevey, appy).
stolen(galacticaS3, stevey).

rival(A, B) :- competitor(A,B).
unethical(A) :- boss(A,Z), stolen(X, A), product(X, Y) , rival(Y, Z).
