AEX = read.csv("AEX_P_RV.csv", header = T);
attach(AEX)
n = length(P);
r = log(P[2:n])-log(P[1:(n-1)]);
plot(r, type="l");

acf(r);
pacf(r);


library(forecast)

ar.fit = Arima(r, order=c(0,0,0));
ar.hat = forecast(ar.fit, h=25);