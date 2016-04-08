library(dplyr)

sprinters <- read.csv("sprinters.csv")

# A
sprinters_orig <- sprinters[sprinters$year < 2005, ]

# B
reg1 <- lm(time ~ year + women, data = sprinters_orig)

# for an increase in year, the time gets faster. 


reg2 <- lm(time ~ year * women, data = sprinters_orig)
# 

reg3 <- lm(time ~ year, data = filter(sprinters_orig, women == 1))


reg4 <- lm(time ~ year, data = filter(sprinters_orig, women == 0))


# C 

library(ggplot2)

reg1_plot <- ggplot(sprinters_orig, aes(x = year, y = time)) +
  geom_point(aes(colour = women)) +
  geom_smooth(method = lm, se = FALSE)

