# Read in the data
spx <- read.csv("data/sp_500_yearend.csv")

library(dplyr)

## yearly return

spx_yoy_return <- mutate(
  spx,
  Return = c(NA, diff(Close)) / lag(Close)
)

# Write results to file
write.csv(spx_yoy_return, "data/sp_500_returns.csv")
