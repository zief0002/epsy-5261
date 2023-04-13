library(tidyverse)
library(chron)


22.23
22:21–22:25

n = 6275
M = as.POSIXct("2023-04-10 ")

M = as.numeric(hms("22:23:00"))
M = as.numeric(hms("22:23:00"))

60 * 10 + 23

# Bedtime (pre-school start time change)
qt(p = .975, df = 6274)
SD = 2 * sqrt(6275) / qt(p = .975, df = 6274) 

#SD = 80.81742

n = 75

# Bedtime
set.seed(700)
test = round(rnorm(n, mean = 623, sd = 80.81742), 0)
#paste0(floor(test / 60), ":", test %% 60)


# Wake-up
# 05:46

SD = 1 * sqrt(6275) / qt(p = .975, df = 6274) 

set.seed(100)
test2 = round(rnorm(n, mean = 346, sd = 40.40871), 0)
#paste0(floor(test2 / 60), ":", test2 %% 60)


# FUnction to round to the nearest 5
mround <- function(x, base){
  base*round(x/base)
}

> mround(14,5)



# Create data frame
sleep_data_pre = data.frame(

    test,
  test2
  # bedtime = 
  # wakeup = paste0(floor(test2 / 60), ":", test2 %% 60, ":00")
) |>
  mutate(
    test = 5 * round(test / 5),
    test2 = 5 * round(test2 / 5),
    bedtime2 = if_else(test < 720, paste0(floor(test / 60) + 12, ":", test %% 60, ":00"), paste0(floor((test - 720) / 60), ":", test %% 60, ":00")),
    wakeup2 =  paste0(floor(test2 / 60), ":", test2 %% 60, ":00"),
    sleep = 720 - test + test2,
    hrs_sleep = sleep / 60
    # chron(times = ),
    # chron(times = )
  ) |>
  select(
    bedtime = bedtime2, wakeup = wakeup2, hrs_sleep,
    -test, -test2, -sleep
    )


sleep_data_pre |>
  write_csv("~/Desktop/teen-sleep.csv")








