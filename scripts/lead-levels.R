### MN Lead Levels (https://www.cdc.gov/nceh/lead/docs/cbls-national-data-table-508.pdf)

set.seed(42)
lead1 = VGAM::rtriangle(n = 90430, theta = 2.5, lower = 0, upper = 5)
lead2 = VGAM::rtriangle(n = 1090, theta = 7.5, lower = 5, upper = 10)
lead3 = VGAM::rtriangle(n = 123, theta = 12.5, lower = 10, upper = 15)
lead4 = VGAM::rtriangle(n = 46, theta = 17.5, lower = 15, upper = 20)
lead5 = VGAM::rtriangle(n = 17, theta = 22.5, lower = 20, upper = 25)
#lead6 = VGAM::rtriangle(n = 0, theta = 35, lower = 25, upper = 45)

91706 - (1090 + 123 + 46 + 17)
(1090 + 123 + 46 + 17) / 91706

# lead = VGAM::rtriangle(n = 385, theta = 8.074, lower = .005, upper = 39.88)
# lead = rnorm(n = 385, mean = 9.074, sd = 4.50)

mn = data.frame(
  lead_level = c(lead1, lead2, lead3, lead4, lead5)
) |>
  mutate(
    lead_level = round(lead_level, 2),
    above_cdc = if_else(lead_level > 5, "Yes", "No")
  )

head(mn)

mn |>
  group_by(above_cdc) |>
  count()


mn |>
  write_csv("~/Desktop/mn-lead.csv")
