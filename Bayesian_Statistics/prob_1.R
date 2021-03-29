# t probability distribution function
t_pdf <- function(x, v, mu, sigma){
  prob<-c()
  for (i in 1:length(x)){
    prob[i] <- gamma((v+1)/2)/(sigma*sqrt(v*pi)*gamma(v/2))*(1+(x[i]-mu)^2/(v*sigma^2))^(-(v+1)/2)
  }
  return(prob)
}  

par(mfrow = c(1,1))
x<- seq(-5,5,length=100)

plot(x,dnorm(x), type = 'l', xlim = c(-5,5), ylim = c(0,0.6))
lines(x, t_pdf(x,4,0,sqrt(2/4)), lty =2)
lines(x, t_pdf(x,10,0,sqrt(8/10)), lty =3)
legend("topright",c("N(0,1)", "df=4, t(0,2/4)", "df=10, t(0,8/10)"), lty=1:3)



