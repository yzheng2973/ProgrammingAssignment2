
## makeCacheMatrix stores a list of functions. "Set" function stores the changes of the vector in the main function. m is set to inverse when the setmatrix function is called.

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     set <- function(y){
     	x <<- y
     	m <<- NULL
     }
get <- function() x
setmatrix <- function(solve) m <<- solve
getmatrix <- function() m
list(set = set, get = get, 
     setmatrix = setmatrix, 
     getmatrix = getmatrix)
     
}


## The input of cacheSlove is the object stored in the makeCacheMatrix function. It first check whether the inverse already calculated in the above function then it simply returns the value m; otherwise it will calculate the inverse for the new matrix.

cacheSolve <- function(x=matrix(), ...) {
	 m <- x$getmatrix()
	 if(!is.null(m)){
	 	 message("getting cache data")
	 	 return(m)
	 }
	 matrix <- x$get()
	 m<-solve(matrix, ...)
	 x$setmatrix(m)
	 m
        ## Return a matrix that is the inverse of 'x'
}

## Testing:
a<- makeCacheMatrix()
a$set(matrix(1:4,2,2))
cacheSolve(a)