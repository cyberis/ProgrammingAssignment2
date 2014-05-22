# cvTestHarness.R - Test Harness to run the cachevector code
# Read in the vector caching code
source("cachevector.R")
# Create two special vectors to make sure they are independent
v1 <- makeVector(c(1, 2, 3, 4, 5, 6, 7, 8))
v2 <- makeVector(c(10, 11, 12, 13, 14, 15, 16, 17, 18))
# Check the first vector and see if the mean is cached
cachemean(v1)
#[1] 4.5
cachemean(v1)
#getting cached data
#[1] 4.5
# Check the second vector to make sure it is independent of the first and caches
cachemean(v2)
#[1] 14
cachemean(v2)
#getting cached data
#[1] 14
# Change the first vector and make sure the cache is dumped
v1$set(c(2, 2, 2))
cachemean(v1)
#[1] 2
cachemean(v1)
#getting cached data
#[1] 2
# Everything worked as expected. Make sure the new code works this way too
