x<- seq(1,15)
plot(x, dbinom(x,10,0.7), type = 'l', ylim = c(0,0.3), ann = FALSE)
y<- seq(1,15,by=0.01)
lines(y, dnorm(y,mean = 10*0.7, sd = sqrt(10*0.7*0.3)), lty=2)
legend("topright",c("B(10,0.7)", "N(7,2.1)"), lty=1:2)
title(main = 'Probability density function', xlab = "x", ylab = "f(x)")


x<- seq(20,100)
plot(x, dbinom(x,100,0.7), type = 'l', ann = FALSE)
y<- seq(20,100,by=0.01)
lines(y, dnorm(y,mean = 100*0.7, sd = sqrt(100*0.7*0.3)), lty=2, col = "red")
legend("topright",c("B(100,0.7)", "N(7,21)"), lty=1:2)
title(main = 'Probability density function', xlab = "x", ylab = "f(x)")


