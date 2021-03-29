# inverse Gamma distribution probability function
ig_pdf <- function(x, alpha,beta){
  prob<-c()
  for (i in 1:length(x)){
    prob[i] <- (beta^alpha)/gamma(alpha)*x[i]^(-alpha-1)*exp(-beta/x[i])
  }
  return(prob)
}  

par(mfrow = c(1,1))
x<- seq(0.00000001,5,length=100)

plot(x,ig_pdf(x,0.1,0.1), type = 'l', xlim = c(-0.5,5), ylim = c(0,1.5))
lines(x, ig_pdf(x,1,1), lty =2)
lines(x, ig_pdf(x,10,10), lty =3)
legend("topright",c("IG(0.1,0.1)", "IG(1,1)", "IG(10,10)"), lty=1:3)



