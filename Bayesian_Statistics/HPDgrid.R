HPDgrid=function(prob,level=0.95){
  prob.sort=sort(prob, decreasing = T)
  M=min(which(cumsum(prob.sort)>=level))
  height=prob.sort[M]
  HPD.index=which(prob>=height)
  HPD.level=sum(prob[HPD.index])
  res=list(index=HPD.index, level=HPD.level)
  return(res)
}

N=1001;
theta=seq(0,1,length=N);
prob=theta^3*(1-theta)^7;
prob=prob/sum(prob);
alpha=0.05;
level=1-alpha;
HPD=HPDgrid(prob,level);

HPDgrid.hat=c(min(theta[HPD$index]),max(theta[HPD$index]));
HPDgrid.hat