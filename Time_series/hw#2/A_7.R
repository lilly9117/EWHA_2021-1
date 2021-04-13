set.seed(1)
n=1000000; 
y=c(); 
y[1]=1/0.32; 
y[2]=1/0.32; 

a=rnorm(n)
for (t in 3:n){
  y[t]=1+0.2*y[t-1]+0.48*y[t-2]+a[t]}; 

acf.y = acf(y, main = 'ACF')

rho.eqn=c(); 
for (k in 3:60) 
  rho.eqn[k] = acf.y$acf[k]-0.2*acf.y$acf[k-1]-0.48*acf.y$acf[k-2]; 
plot(rho.eqn)