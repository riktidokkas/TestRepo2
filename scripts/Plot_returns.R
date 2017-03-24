# Read in data from previous step
spx.returns <- read.csv("data/sp_500_returns.csv")

library(ggplot2)
ggplot(spx.returns,
  aes(x = Year, y = Return)) +
  geom_point()

ggsave("results/sp_500_returns.png")


