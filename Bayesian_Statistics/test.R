HPDgrid = function(prob, level = 0.95){ 
  prob.sort = sort(prob, decreasing = T)
  M = min (which(cumsum(prob.sort)>=level)) 
  height = prob.sort[M]
  HPD.index = which(prob >= height)
  HPD.level = sum(prob[HPD.index])
  res = list(index = HPD.index, level = HPD.level) 
  return(res)
}

N = 1000;
theta = seq(0,1, length = N);

n = 22;
x = 17; 
a = 1;
b = 1;
f_theta = dbeta(theta, a+x, n-x+b)
prob = f_theta/sum(f_theta)

alpha = 0.05
level = 1- alpha
HPD = HPDgrid(prob, level)

HPDgrid.hat = c(min(theta[HPD$index]), max(theta[HPD$index])) 
HPDgrid.hat