a=4; b=7;
x=3; n=10;
m=10; z = c(0:10);

pred.z = gamma(m+1)/gamma(z+1)/gamma(m-z+1)*beta(a+z+x, 
                                                  b+n-x+m-z)/beta(a+x, b+n-x)

plot(z, pred.z, xlab="z", ylab="probability", type="h")
title("Predictive Distribution, a=1, b=1, n=40, x=15, m=10")