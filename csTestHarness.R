# csTestHarness.R - Test Harness to run the cachesolve code
# Read the cache matrix code in
source("cachematrix.R")
# Create a sample matrix that is known invertible
m <- matrix(c(1,0, 5, 2, 1, 6, 3, 4, 0), nrow = 3)
m
#     [,1] [,2] [,3]
#[1,]    1    2    3
#[2,]    0    1    4
#[3,]    5    6    0
# Create a special matrix from this normal matrix
im <- makeCacheMatrix(m)
# Solve the matrix for it's inverse
cacheSolve(im)
#      [,1] [,2] [,3]
# [1,]  -24   18    5
# [2,]   20  -15   -4
# [3,]   -5    4    1
# Do it again and see if you get a cached copy
cacheSolve(im)
# returning cached matrix inversion...
#      [,1] [,2] [,3]
# [1,]  -24   18    5
# [2,]   20  -15   -4
# [3,]   -5    4    1
# Try it a third time to make SURE you get a cached solution
cacheSolve(im)
# returning cached matrix inversion...
#      [,1] [,2] [,3]
# [1,]  -24   18    5
# [2,]   20  -15   -4
# [3,]   -5    4    1
# Create a new matrix that is a 2 x 2 invertible and see if that changes the special matrix (it shouldn't)
m <- matrix(c(2, 9, 6, 1), nrow = 2)
m
#      [,1] [,2]
# [1,]    2    6
# [2,]    9    1
# Try solving the previous special matrix to make sure the solution didn't chage
cacheSolve(im)
returning cached matrix inversion...
#      [,1] [,2] [,3]
# [1,]  -24   18    5
# [2,]   20  -15   -4
# [3,]   -5    4    1
# Create a new special matrix with our 2 x 2 matrix
im2 <- makeCacheMatrix(m)
# Solve the second special matrix (now we should get a new solution)
cacheSolve(im2)
#             [,1]        [,2]
# [1,] -0.01923077  0.11538462
# [2,]  0.17307692 -0.03846154
# Solve it a second time (should get cached solution for 2 x 2 matrix)
cacheSolve(im2)
#returning cached matrix inversion...
#             [,1]        [,2]
# [1,] -0.01923077  0.11538462
# [2,]  0.17307692 -0.03846154
# Now set the matrix of the first special matrix with a new 2 x2 invertible matrix
im$set(matrix(c(3, 8, 2, 7), nrow = 2))
# Solve the first special matrix that has a new 2 x 2 matrix in it
cacheSolve(im)
#      [,1] [,2]
# [1,]  1.4 -0.4
# [2,] -1.6  0.6
# Solve a second time to get a cached solution
cacheSolve(im)
returning cached matrix inversion...
#      [,1] [,2]
# [1,]  1.4 -0.4
# [2,] -1.6  0.6
# Everything checks out A OK!!