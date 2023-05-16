library(LikertMakeR)


x <- lexact(
  n = 72,
  mean = 2.71,
  sd = 0.846,
  lowerbound = 1,
  upperbound = 4,
  items = 1
)


x2 <- lexact(
  n = 72,
  mean = 2.81,
  sd = 0.781,
  lowerbound = 1,
  upperbound = 4,
  items = 1
)

x3 <- lexact(
  n = 72,
  mean = 2.99,
  sd = 0.682,
  lowerbound = 1,
  upperbound = 4,
  items = 1
)


.846 / sqrt(72)


X = data.frame(x, x2, x3)

mean(X$x)
sd(X$x)




X |>
  sample_n(50) -> X2
X2

mean(X2$x)
sd(X2$x)


set.seed(42)
X |>
  rename(prior_knowledge = x, only_achievement = x2, prompt_feedback = x3) |>
  sample_n(30) |>
  write_csv("~/Desktop/continuous-assessment.csv")


