library(tidyverse)

set.seed(90)
mean(round(rnorm(10, mean = 6, sd = 4), 0))


# Values for thought experiment


credits = function(n) {
  x = round(rnorm(n, mean = 6, sd = 4), 0)
  return(list(x, mean(x)))
}

set.seed(90)

credits(10)

results = rep(NA, 1000)
set.seed(42)
for(i in 1:1000){
  results[i] = mean(round(rnorm(10, mean = 6.5, sd = 4), 0))
}

tibble(results) |>
  ggplot(aes(x = results)) +
  geom_density() +
  xlab("Average number of credits taken") +
  ylab("Density") +
  theme_bw() +
  geom_hline(yintercept = 0) +
  geom_point(x = 7.3, y = 0.004, color = "red", size = 5) +
  geom_point(x = 6.9, y = 0.004, color = "red", size = 5) +
  geom_point(x = 5.3, y = 0.004, color = "red", size = 5) +
  geom_point(x = 4.6, y = 0.004, color = "red", size = 5) +
  geom_point(x = 7.0, y = 0.014, color = "red", size = 5)

