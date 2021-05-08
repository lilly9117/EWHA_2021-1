library(fUnitRoots); 
GDP.data=read.csv("Kor_GDP_1960_2018.csv", head=T); 
attach(GDP.data); 
y=GDP
log.y=log(y);
adfTest(log.y, type = "ct", lags = 3)
