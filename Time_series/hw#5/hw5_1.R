
Gov.exp.data=read.csv('Gov_Exp_data_HW.csv', head=T);  
Gov.exp.data = Gov_Exp_data
attach(Gov.exp.data); 
plot(Gov.Exp,type="l")
y = Gov.Exp

acf(y, lag=40);

n=length(y); 
dy = y[2:n]-y[1:(n-1)];
plot(dy, type="l");

acf(dy, lag=40);


n.d = length(dy);
sd.y = dy[5:n.d] - dy[1:(n.d-4)];
plot(sd.y,type='l')

acf(sd.y, lag=40);
