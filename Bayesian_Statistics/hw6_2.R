# 1
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

theta = rnorm(1000,150,1);

HPD = HPDsample(theta)

# 2

x_bar = 150;
alpha = 0.05;
sigma_2 = 21;
n = 20;
HPD_interval = c(x_bar - qnorm(1-alpha)*(sigma_2/n)^(1/2),x_bar + qnorm(1-alpha)*(sigma_2/n)^(1/2))

# 3

# one
mu1<- 150;
sig1 <- 1;

# two
mu2<-150;
sig2 <- 21/20;

theta<-seq(mu1 -5*sig1, mu1+5*sig1, length=1000)

plot(theta, dnorm(theta,mu1, sig1), type="l")
lines(theta,dnorm(theta,mu2,sig2),lty=2)
legend(152,0.3,legend=c("one","two"),lty=c(1,2),bty="n")

# 5
mu1<- 150;
sig1 <- 2.2;

sum=0;
for(x in 150:153) 
  sum = sum + dnorm(x,mu1, sig1);
sum
