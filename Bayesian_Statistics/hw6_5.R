#1
mu<-0.33;
sig <- 0.05;

theta<-seq(mu -5*sig, mu+5*sig, length=1000)

plot(theta, dnorm(theta,mu, sig), type="l")

#2 
HPDsample=function(theta,level=0.95){
  N=length(theta);
  theta.sort=sort(theta);
  M=ceiling(N*level);
  nCI=N-M;
  CI.width=rep(0,nCI);
  for(i in 1:nCI)
    CI.width[i]=theta.sort[i+M]-theta.sort[i];
  index=which.min(CI.width);
  HPD=c(theta.sort[index],theta.sort[index+M]);
  return(HPD)
}

mu<-0.33;
sig <- 0.05;
theta = rnorm(1000,mu,sig);

HPD = HPDsample(theta)
