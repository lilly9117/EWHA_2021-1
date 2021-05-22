library(forecast)

y = Gov.Exp
M=1; k=1; bic = c() #1이하라고 가정(M=1)

for (p in 0:M){
  for (q in 0:M){
    for (P in 0:M){
      for (Q in 0:M){
        fit = Arima(y, order=c(p,1,q), seasonal = list(order=c(P,1,Q), period=4), method="ML")
        bic[k] = fit$bic;
        k = k+1
      }
    }
  }
}

Arima(y, order= c(0,1,1),
      seasonal = list(order = c(0,1,1),
                      period=4), method = "ML")