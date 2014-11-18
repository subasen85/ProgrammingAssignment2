## Put comments here that give an overall description of what your
## functions do

##The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
##set the value of the matrix
##get the value of the matrix
##set the value of the solve
##get the value of the solve 

makeCacheMatrix <- function(x = matrix()) {
print("Inside makeCacheMatrix")
        s <- NULL
        set <- function(y) {
                x <- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
		print("Before calling list")
		print(x)
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)

}


## The following function calculates the solve of the special "matrix" created with the above function.However, it first checks to see if the solve has already been calculated.If so, it gets the solve from the cache and skips the computation. Otherwise, it calculates the solve of the data and sets the value of the solve in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         s <- x$getsolve()
		print("Inside cachesolve")
		print(s)
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}
