a = 2; b = 1;
n = 10; s = 12;

theta = seq(0,6,length=100);
plot(theta,dgamma(theta,a+s,b+n),type="l",
     xlab=expression(theta),
     ylab="posterior",s
     lwd=2,ylim=c(0,1.5),
     col="blue")




lines(theta,dgamma(theta,a,b),col="black",lwd=2)

legend(4,1.3,legend=c(paste("Posterior"),paste("prior")),
       col=c("blue","black"),lwd=2,bty="n")
