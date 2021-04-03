# phi = -0.8
set.seed(1)

n = 1000
a = rnorm(n, mean = 0, sd = 5)
y = rep(n,0)
mu = 10
y[1] = mu

phi = -0.8
for (t in 2:n){
  y[t] = mu + phi*(y[t-1]-mu) + a[t]
}
plot(y,type="o", ann = FALSE)
title(main = 'phi = -0.8', ylab = 'yt')

mean(y)
var(y)

acf(y)

pacf(y)


# phi = 0.8
set.seed(1)

n = 1000
a = rnorm(n, mean = 0, sd = 5)
y = rep(n,0)
mu = 10
y[1] = mu

phi = 0.8
for (t in 2:n){
  y[t] = mu + phi*(y[t-1]-mu) + a[t]
}
plot(y,type="o", ann = FALSE)
title(main = 'phi = 0.8', ylab = 'yt')

mean(y)
var(y)

acf(y)

pacf(y)


# phi = 1
set.seed(1)

n = 1000
a = rnorm(n, mean = 0, sd = 5)
y = rep(n,0)
mu = 10
y[1] = mu

phi = 1
for (t in 2:n){
  y[t] = mu + phi*(y[t-1]-mu) + a[t]
}
plot(y,type="o", ann = FALSE)
title(main = 'phi = 1', ylab = 'yt')

mean(y)
var(y)

acf(y)

pacf(y)


