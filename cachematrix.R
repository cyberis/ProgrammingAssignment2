## cachematrix.R - Create a Matrix class that caches the Inverse once it has been created since
##                  it is a very expensive operation
## Submitted by: Christopher Bortz
## For: R Programming (Section 003 - May 5 - June 2, 2014)
## Instructor: Dr. Rodger Peng
## Summary: There is a function that instantiates a Matrix Caching Class and one that uses that class to return the inverse
## of a matrix, cached version if already solved, otherwise solve and then cache the inverse

## Creates an S3 type like class that can cache a matrix and its inverse
## and returns a list of its public methods
makeCacheMatrix <- function(theMatrix = matrix()) {
    invMatrix <- NULL  # This will hold the Inverted Matrix once caled
    
    # Set the matrix data
    set <- function(newMatrix) {
        theMatrix <<- newMatrix
        invMatrix <<- NULL
    }
    
    # Get the internal matrix data
    get <- function() {
        return(theMatrix)  # I know this isn't idiomatic R but it is consistent cross language style
    }
    
    # This will store the matrix inverse
    setInverse <- function(theInverse) {
        invMatrix <<- theInverse
    }
    
    # This function wil get the matrix inverse that is stored
    getInverse <- function() {
        return(invMatrix)  # I know this isn't idiomatix R but it is consistent cross language style
    }
    
    # Return a list of functions that can manipulate this object
    return(list(set = set, 
                get = get,
                setInverse = setInverse, 
                getInverse = getInverse))
}


## Uses our Matrix Inverse Caching class to solve the first time but cache the inverse ofter that until the matrix changes
## Returns the Inverse from cache if already solved or from a new solution
## NOTE: In accordance with the assignment instructions this will always assume it got an invertible matrix
cacheSolve <- function(theMatrix, ...) {
    # Let's see if we already have the inverse cached
    theInverse <- theMatrix$getInverse()
    
    # If this is cached, then let the user know and return it
    if(!is.null(theInverse)) {
        message("returning cached matrix inversion...")
        return(theInverse)
    } else { # We need to calculate the inverse, cache it and return it
        aMatrix <- theMatrix$get()
        theInverse <- solve(aMatrix) #Note: that we don't pass any additional parameters or this won't perform the inversion
        theMatrix$setInverse(theInverse)
        return(theInverse)
    }
}
