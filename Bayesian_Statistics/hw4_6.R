HPDsample=function(theta,level=0.95){
  N=length(theta)
  theta.sort=sort(theta)
  M=ceiling(N*level)
  
  nCI=N-M  # number of possbile CIs
  CI.width=rep(0,nCI)
  
  for( i in 1:nCI)CI.width[i]=theta.sort[i+M]-theta.sort[i]
  index=which.min(CI.width)
  HPD=c(theta.sort[index], theta.sort[index+M])
  return(HPD)
}

a=1;
b=1;
n1=20; x1=10 ; n2=20; x2=14

theta1 = rbeta(10000, a+x1, b+n1-x1)
theta2 = rbeta(10000, a+x2, b+n2-x2)

xi = log((theta1/(1-theta1))/(theta2/(1-theta2)))

# HPD=HPDsample(xi)
mean(xi)

plot(density(xi),type="l", xlab="로그 오즈비 ",       
     ylab="posterior density", main="")
abline(v=HPD, lty=2)
text(mean(xi),0.06, "95% HPD interval" )

