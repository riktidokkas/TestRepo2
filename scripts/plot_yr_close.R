# Read in the data
spx <- read.csv("data/sp_500_yearend.csv")

library(ggplot2)
ggplot(spx,
       aes(x = Year, y = Close)) +
  geom_point()

ggsave("results/sp_500_year_close.png")
