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

N=30000
theta=rnorm(N,14.97,sqrt(3.93))
alpha=0.05
level=1-alpha
HPDsample(theta)