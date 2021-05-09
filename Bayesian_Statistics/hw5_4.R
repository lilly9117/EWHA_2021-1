
R_1 = rgamma(1000,1+225,1+100);
R_2 = rgamma(1000,1+210,1+100);

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

eta = log(R_1/R_2);
mean(eta)
HPD = HPDsample(eta)