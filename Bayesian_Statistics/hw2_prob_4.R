down_prob<- 0
for(k in 1:9){
  down_prob <- down_prob + (k/10)^3*(1-k/10)^2
}
down_prob <- down_prob * (1/9)

prob <- c()

for(theta in 1:9){
  prob[theta] <- ((1/9)*(theta/10)^3*(1-theta/10)^2) / down_prob
}

plot(prob,type = 'o', ann = FALSE)
title(main = 'Posterior probability', xlab = "theta", ylab = "prob")