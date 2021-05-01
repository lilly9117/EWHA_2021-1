n = 1000;
set.seed(1);
y = matrix(rep(0,100*n),nrow=100,ncol=n);
for (j in 1:100){
  y[j,1] = 0;
  a = rnorm(n);
  for (t in 3:n) {
    y[j,t]=0.5*y[j,t-1]+0.5*y[j,t-2]+a[t];
    }
}

var.y = c();
for (t in 1:n){
  var.y[t] = var(y[,t]);
}
plot(var.y, type='l')
