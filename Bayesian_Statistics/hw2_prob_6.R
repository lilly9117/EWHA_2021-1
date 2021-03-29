
prob <- c()
x<- seq(-5,5,by = 0.1)

for(i in 1:length(x)){
  prob[i] <- (1/2)*(1/sqrt(2*pi)*exp(-(1/2)*(x[i]^2)))
}

plot(x,prob, type = 'l', xlim = c(-5,5), ylim = c(0,0.5), ann = FALSE)
points(0, 1/2, col = "black",pch=16)
points(0, (1/2)*(1/sqrt(2*pi)*exp(-(1/2)*(0^2))))
title(main = 'Probability density function', xlab = "x", ylab = "f(x)")