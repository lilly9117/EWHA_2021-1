a = 0.1; b= 1;
x =0; n = 10;
m = 20;
N = 50000;
theta = rbeta(N, a+x, b+n-x)

pred.z = c(1:(m+1))*0
for (z in c(0:m)){
  pred.z[z+1] = mean(dbinom(z,m,theta))
}

zsample = rbinom(N,m,theta)

plot(table(zsample)/N, type = "h", xlab="z", ylab= "predictive density", main="")


table(zsample)/N
