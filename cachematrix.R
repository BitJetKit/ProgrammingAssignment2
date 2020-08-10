## Caching the Inverse of a Matrix:
## Matrix inversion is usually a costly calculation, but there are
## a number of benefits caching the inverse of a matrix, instead of than calculating it, repeatedly:
## More RAM shall be available, more arithmetic-logic can be calculated, more memory to memory data transfers
## reduces computer overhead because the reader doing less of these calculations is resultant this way: less heat
## thus less power consumed.
## Below are a functional couple; but these are used queued individually, starting with makeCacheMatrix,
## and you can create a special object that stores a matrix then this special object caches the matrix's inverse.

## The makeCacheMatrix matrix makes a special
## matrix: it can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) i <<- 
    getInverse <- function() i
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## The cacheSolve function calculates the inverse
## of the special matrix that the makeCacheMatrix
## matrix returns. In the event that the inverse
## has already been calculated, and the matrix in
## question is unchanged, then cacheSolve shall
## retrieve its inverse: from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
