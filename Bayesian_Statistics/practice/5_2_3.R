a= 0.4; b = 1.8;
n = 10; x = 2;

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

N = 5000
theta = rbeta(5000, a+x, b+n-x)
alpha=0.05
level=1-alpha
HPDsample(theta)