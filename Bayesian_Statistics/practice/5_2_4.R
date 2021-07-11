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

theta = seq(0, 1, length=100)
Prior = rbeta(5000, a, b)
Posterior = rbeta(5000, a+x, b+n-x)
Pr = log(Prior/(1- Prior)); 
Post = log(Posterior /(1- Posterior))

HPD=HPDsample(Pr)
HPD

HPD=HPDsample(Post)
HPD


plot(density(Post),type="l", xlab="log odds ratio", ylab="posterior", main="")
abline(v=HPD, lwd=2)
text(mean(Post),0.06, "95% HPD interval" ) 
lines(density(Pr), type="l",col="blue",lwd=2) 
HPD

