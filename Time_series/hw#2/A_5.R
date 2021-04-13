set.seed(1)
n=1000000; 
y=c(); 
y[1]=1/0.32; 
y[2]=1/0.32; 
a=rnorm(n)
for (t in 3:n){
  y[t]=1+0.2*y[t-1]+0.48*y[t-2]+a[t]}; 

acf.y = acf(y, lag.max=20, main = 'ACF')
pacf.y = pacf(y, lag.max=20, main = 'PACF')
