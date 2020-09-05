# A pair of functions that cache the inverse of a matrix.

# FUN cacheSolve:  
# In R, solve(sq_matrix) returns its inverse.

## create a special matrix object that can cache its inverse
## input matrix is assumed to be invertible .
## returns a list of functions that can apply to the given x.


makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL # initiate inverse as a NULL obj.
        setCache <- function()  inverse <<- solve(x) # access a variable outside the scope
        getCache <- function() inverse
        list(set=setCache, get=getCache)
    
}

## computes the inverse of the special matrix returned by the first func. 
## If the inverse has been calculated, the function retrieve the inverse from the cache.
##  RUN THIS PROGRAM, NO NEED TO RUN THE FIRST ONE. 

cacheSolve <- function(x) {
        
        c <-makeCacheMatrix(x) # create a list of vectors associated with x. 
        inv <- c$get()
     
        if(!is.null(inv)){
                print("Returning the inverse matrix from the cache")
                return(inv)
        }
        
        c$set()
        inv<-c$get() ## Return a matrix that is the inverse of 'x'
        inv

}

