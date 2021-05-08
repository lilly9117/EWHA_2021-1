arima.fit = Arima(log.y, order = c(3,1,0))
L = c(); Q = c(); p = c();
for (i in 1:4) { L[i] = 6*i;
Q[i] = Box.test(arima.fit$residuals, 
                lag = L[i],
                type = "Ljung-Box")$statistic
df = L[i]
p[i] = 1-pchisq(Q[i],df)}
Portmanteau = cbind(L,Q,p)


library(portes); 
arima.fit = Arima(log.y, order = c(3,1,0))
portest(arima.fit$residuals,
        lags=c(6, 12, 18, 24),
        test="LjungBox");

Box.test(arima.fit$residuals,
         lag=24,
         type="Ljung-Box")

acf(arima.fit$residual)

log.y.hat = forecast(arima.fit, h=5);
plot(log.y.hat)