set.seed(1)
n=1000000; 
y=c(); 
y[1]=5; 
y[2]=5; 
a=rnorm(n)
for (t in 3:n){
  y[t]=5+a[t]+0.2*a[t-1]+0.48*a[t-2]}; 

acf.y = acf(y, lag.max=20, main = 'ACF')
pacf.y = pacf(y, lag.max=20, main = 'PACF')
