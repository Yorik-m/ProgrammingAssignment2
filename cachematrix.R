## Ruturns a list of functions:
    
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m_inv <- NULL
    set <- function(y) {
        x <<- y
        m_inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m_inv <<- inverse
    getinverse <- function() m_inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## calcultes inverse. If inverse was already calculated and input didn't change, returns cached data

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m_inv <- x$getinverse()
    if(!is.null(m_inv)) {
        message("getting cached data")
        return(m_inv)
    }
    data <- x$get()
    m_inv <- solve(data, ...)
    x$setinverse(m_inv)
    m_inv
}
