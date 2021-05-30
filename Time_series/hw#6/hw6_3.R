library(mvtnorm); 
set.seed(1)

A = matrix(c(1.2, 0.2, -0.4, 0.6), nrow = 2, byrow = T)

e = rmvnorm(100, sigma = diag(2))
y = matrix(0, nrow = 100, ncol = 2)

y[1,] = e[1,]

for(t in 2:100) 
  y[t,] = A%*% as.matrix(y[(t-1),]) + as.matrix(e[t,])

plot(y[,1], type="l"); 
plot(y[,2], type="l");

eigen(A);

Pi = A - diag(2);

Beta=c(1,1)
Z = y%*%Beta;
plot(Z, type="l");

