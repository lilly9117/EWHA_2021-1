a= 0.4; b = 1.8;
n = 10; x = 2;

theta = seq(0,1,length=100)
prior.theta = dbeta(theta,a,b)
post.theta = dbeta(theta,a+x, b+n-x)

plot(theta, post.theta, type = "l", col = "black", lwd=2)
lines(theta, prior.theta, type = "l", col = "blue", lwd=2)

legend(.5, 3, legend=c(paste("beta(",a,", ",b,") prior"),
                       paste("post under beta(",a+x,", ",b+n-x,") prior")),
       lty=c(2,1), col=c("blue", "black"), bty="n")