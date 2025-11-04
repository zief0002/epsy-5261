

draw_sample = function(n){
  my_sample = rnorm(n = n, mean = 10, sd = 2)
  m = mean(my_sample)
  s = sd(my_sample)
  lb = m - qt(.975, df = 24) * s / sqrt(n)
  ub = m + qt(.975, df = 24) * s / sqrt(n)
  d = as.data.frame(do.call(cbind, list(m, s, lb, ub)))
  return(d)
}


set.seed(100)
draw_sample(n = 25)


x = vector(mode='list', length=100)
x

set.seed(100)
for(i in 1:100){
  x[[i]] = draw_sample(n = 25)
}

x

d = as.data.frame(do.call(rbind, x))
unlist(d)

names(d) = c("M", "SD", "LB", "UB")
d$Sample = 1:nrow(d)
d$Good = if_else(10 >= d$LB & 10 <= d$UB, "Good", "Not Good")

ggplot(data = d) +
  geom_hline(yintercept = 10) +
  geom_errorbar(aes(ymin = LB, ymax = UB, x = Sample, color = Good)) +
  geom_point(aes(y = M, x = Sample, color = Good), size = 3) +
  theme_bw() +
  scale_x_continuous(name = "", breaks = NULL) +
  ylab("Estimate for Population Mean") +
  theme(
    panel.background = element_rect(fill = "white", colour = "grey50")
  ) +
  coord_flip() +
  scale_color_manual(values = c("#bdc2bf", "#ff2d21")) +
  guides(color = "none")



  


