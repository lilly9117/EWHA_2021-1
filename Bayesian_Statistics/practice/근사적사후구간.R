theta <- rbeta(5000, a+x, b+n-x)

hist(theta, prob=T, main="Histogram of theta") 

lines(density(theta))

mean.theta <- mean(theta) 
abline(v=mean.theta, lty=2) 

quantile(theta, c(.025, .975)) 
qbeta(c(.025, .975), a+x, b+n-x)

mean(theta) ; var(theta)