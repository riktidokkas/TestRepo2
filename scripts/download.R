# 1: Download the data
# spx <- read.csv("http://asda.stat.ubc.ca/workshops/data/sp500_yearend.csv")
spx_raw <- read.csv("http://asda.stat.ubc.ca/workshops/data/sp500_yearend_raw.csv")

# Save the data
# write.csv(spx, "data/sp_500_yearend.csv")
write.csv(spx_raw, "data/sp_500_yearend_raw.csv")
