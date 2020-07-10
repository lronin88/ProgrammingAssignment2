## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## Use cache option if available
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
#Checking:
a<-matrix(c(1,4,6,3,5,7,8,9,2),nrow=3,ncol=3)
print(a)
b=det(a)
print(b)
myMatrix_object<-makeCacheMatrix(a)
cacheSolve(myMatrix_object)
cacheSolve(myMatrix_object)
sol<-solve(a)
print(sol)
