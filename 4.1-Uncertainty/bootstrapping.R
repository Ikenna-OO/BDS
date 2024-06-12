# clear environment
rm(list = ls())

# import libraries
library(datasets)

getwd()
# change current working director

# import data
browser <- read.csv("browser-domains.csv")

# look at data's head
head(browser)

# implementing a bootstrap
B <- 1000 # number of resamples
B
mub <- c() # initialize mub to a numeric vector of length B
# loop through to resample
for (b in 1:B){ 
  # chooses a bunch of row indices with replacement and 
  # adds the average of their visits values to the mub vector
  samp_b <- sample(nrow(browser), replace = T)
  mub <- c(mub, mean(browser$visits[samp_b]))
}

mub_sd <- sd(mub)
mub_sd

hist(mub, breaks = 30, col = "skyblue", xlab = "Sample Means", ylab = "Frequency", main = "Histogram of Sample Means")

browser[sample(nrow(browser), size = 1),] # returns a random entry within the data
dim(browser) # get dimensions or shape of the browser data (3 columns, lots of rows)

sort(samp_b)[1:10] # what's happening here??

View(browser)
# fitting a linear regression
lm_reg <- glm(browser ~ site + visits, data)


C <- 2000
vec <- c()
for (c in 1:C){
  lm_reg <- glm(browser ~ site + visits)
  vec <- c(vec, sd())
}

# detach libraries
detach("package:datasets", unload = TRUE)

# clear console
cat("\014")

