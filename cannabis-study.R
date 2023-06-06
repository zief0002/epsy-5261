# Compute SDs
0.14*sqrt(14) #Adult
0.10*sqrt(23) #Teen

# Function to get specific mean and sd
rnorm_fixed <- function(n, mean, sd) {    # Create user-defined function
  as.vector(mean + sd * scale(rnorm(n)))
}

# Simulate IQ decreases in SD units
set.seed(42)
adult = rnorm_fixed(n = 14, mean = -0.14, sd = 0.524)
teen = rnorm_fixed(n = 23, mean = -.55, sd = 0.480)


#WAIS-IV
# M = 100
# SD = 15

adult2 = round(adult*15)
teen2 = round(teen*15)


t.test(adult, teen, var.equal = TRUE)
t.test(adult2, teen2, var.equal = TRUE)
mean(teen2)
mean(adult2)



cannabis = data.frame(
  iq_change = c(adult2, teen2),
  cannabis_dep = c(rep("Adult", 14), rep("Teen", 23)) 
)


library(tidyverse)
cannabis |>
  write_csv("~/Desktop/cannabis.csv")

