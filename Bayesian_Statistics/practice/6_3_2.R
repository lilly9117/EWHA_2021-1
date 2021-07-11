HPDsample=function(theta,level=0.95){
  N=length(theta)
  theta.sort=sort(theta)
  M=ceiling(N*level)
  nCI=N-M
  CI.width=rep(0,nCI)
  for(i in 1:nCI)CI.width[i]=theta.sort[i+M]-theta.sort[i]
  index=which.min(CI.width)
  HPD=c(theta.sort[index], theta.sort[index+M])
  return(HPD)
}

a = 2; b = 1;
n = 10; s = 12;

theta = seq(0,6,length=100)
plot(theta,dgamma(theta,a+s,b+n),type="l",
     xlab=expression(theta),ylab="posterior",lwd=2,ylim=c(0,1.5),
     col="blue")

nsim = 30000
theta.sim = rgamma(nsim,a+s,b+n)
alpha=0.05
level=1-alpha

HPD=HPDsample(theta.sim);

abline( v= HPD,lty=2, lwd=2,col="red")
text(mean(theta.sim),0.2, "95% HPD interval" )

plot(density(theta.sim), type="l", xlab=expression(theta),
     ylab="posterior density", main="")

abline( v= HPD,lty=2, lwd=2,col="red")
text(mean(theta.sim),0.2, "95% HPD interval" )