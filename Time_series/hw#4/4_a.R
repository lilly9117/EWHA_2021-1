GDP.data=read.csv("Kor_GDP_1960_2018.csv", head=T); 
attach(GDP.data); 
y=GDP
plot(y, type="b"); 
log.y=log(y); 
plot(log.y, type="b")

library(forecast);
aic=c(); 
for(p in 1:10){
  ar.fit = Arima(log.y, order = c(p,0,0)); 
  aic[p] = ar.fit$aic};  
which.min(aic)

library(fUnitRoots); 
adfTest(log.y, type = "ct", lags = 3)

log.y=log(y);
n=length(log.y); 
d.log.y = log.y[2:n]-log.y[1:(n-1)]; 
acf(d.log.y);
pacf(d.log.y);

bic=c();
for(p in 1:10){
  arima.fit = Arima(log.y, order = c(p-1,1,0));
  bic[p] = arima.fit$bic};
which.min(bic);

arima.fit = Arima(log.y, order = c(3,1,0))
