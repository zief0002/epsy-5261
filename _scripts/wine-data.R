library(tidyverse)

reds = read_csv("~/Desktop/wines/Red.csv") |>
  mutate(type = "Red")

whites = read_csv("~/Desktop/wines/White.csv") |>
  mutate(type = "White")

roses = read_csv("~/Desktop/wines/Rose.csv") |>
  mutate(type = "Rose")

sparkling = read_csv("~/Desktop/wines/Sparkling.csv") |>
  mutate(type = "Sparkling")


wines = rbind(reds, whites, roses, sparkling)
wines

set.seed(123)

wines2 = wines |>
  sample_n(200)

ggplot(data = wines2, aes(x = Price, y = Rating)) +
  geom_point()


wine = read_csv("https://raw.githubusercontent.com/stoltzmaniac/wine-reviews-kaggle/master/winemag-data_first150k.csv")
wine

wine_more = read_csv("~/Desktop/archive/winemag-data-130k-v2.csv")
wine_more[2, "designation"]



set.seed(1)

set.seed(1234)

wines1 = wine |>
  filter(price <= 100) |>
  sample_n(50)

wines2 = wine |>
  filter(price > 100 & price < 300) |>
  sample_n(50)

wines3 = wine |>
  filter(price > 300) |>
  sample_n(50)

wines4 = rbind(wines1, wines2, wines3)

wine |>
  mutate()
ggplot(data = wine, aes(x = Price, y = Rating)) +
  geom_point() 


write_csv(wines2, "~/Desktop/wine.csv")
