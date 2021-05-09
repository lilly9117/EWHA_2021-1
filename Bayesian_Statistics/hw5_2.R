theta = seq(0, 6, length = 100);
n=6; x_s=3+2+4+3+2+1; 
a=1/2;b=0;
plot(theta, dgamma(theta, a+x_s, b+n), type = 'l', xlab = 'theta', ylab = 'posterior_dist')


a=1;s=8;b=1;n=1;
sum=0;
for(x in 7:9) 
  sum = sum + dnbinom(x,a+s,(b+n)/(b+n+1)); 
sum