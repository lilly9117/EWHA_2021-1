y = Gov.Exp

fit = Arima(y, order = c(0,1,1), 
            seasonal =list(order=c(0,1,1), 
                           period=4), 
            method = "ML")

L= c(); Q= c(); p = c()
for (i in 1:6){
  L[i] = 4*i;
  Q[i] = Box.test(fit$residual, lag=L[i],
                   type = "Ljung-Box")$statistic
  df = L[i]-2 #3=p+q+P+Q

  p[i] = 1-pchisq(Q[i],df)}
Portmanteau = cbind(L,Q,p)
  
acf(fit$residuals);

y.hat = forecast(fit, h=8)

plot(y.hat)
