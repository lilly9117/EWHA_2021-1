a = 2; b = 1;
n = 10; s = 12;

nsim = 30000;
theta.sim = rgamma(nsim,a+s,b+n);
alpha=0.05;
level=1-alpha;

eta=log(theta.sim);
mean(eta)
var(eta)

HPD=HPDsample(eta);  
HPD

plot(density(eta), type="l", xlab="log(theta)", ylab="posterior density",
     main="",lwd=2)
abline( v= HPD,lty=2, lwd=1,col="red")
text(mean(eta),0.2, "95% HPD interval" )