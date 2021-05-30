AEX.data=read.csv("AEX.csv", head=T); 
attach(AEX.data); 

n=length(AEX); 
r=log(AEX[2:n])-log(AEX[1:(n-1)]);

mu = mean(r);
e_t = r-mu;

garch.fit=garchFit(~garch(1,1), 
                   e_t, 
                   include.mean = F);
sigma.hat = predict(garch.fit, n.ahead=1)$standardDeviation
sigma.hat

VaR = mu+qnorm(0.05)*sigma.hat
VaR

sigma_hat = sd(r);
sigma_hat
VaR = mu + qnorm(0.05)*sigma_hat;
VaR

log.Pt_1 = mu + qnorm(0.05) * sigma.hat + log(AEX[n])
log.Pt_1
exp(log.Pt_1)*exp(sigma.hat^2/2)