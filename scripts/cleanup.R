# Read in the data
spx_raw <- read.csv("data/sp_500_yearend_raw.csv")

library(dplyr)
library(tidyr)
spx <- spx_raw %>%
  separate (Date, into = c('Year', 'Month', 'Day'),
            sep = "-") %>%
  filter(Year >=1950) %>%
  select(Year, Open, High, Low, Close, Volume)
  
# Write results to file
write.csv(spx, "data/sp_500_yearend.csv")