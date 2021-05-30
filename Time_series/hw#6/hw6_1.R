AEX.data=read.csv("AEX.csv", head=T); 
attach(AEX.data); 
plot(AEX,type="l"); 

n=length(AEX); 
r=log(AEX[2:n])-log(AEX[1:(n-1)]);
plot(r, type="l");

acf(r);


library(fGarch);

mu = mean(r);
e_t = r-mu;

garch.fit=garchFit(~garch(1,1), 
                   e_t, 
                   include.mean = F)

