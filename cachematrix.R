#### This is pair of functions to 
## 1.help initialize a matrix object with functions to get and set the matrix as well as its inverse and 
## 2. calculate its inverse and cache its value if it is already calculated

##### creating the makeCacheMatrix with getter and setter functions for the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
  
#creating a get function for the matrix
    get <- function() x

#creating a get function for the matrix    
    set <- function(y){
      x <<- y
      inv <<- NULL
    }

#creating a get funtion for the inverse of the matrix
    getInverse <- function() inv

#creating a set function for the inverse of a matrix
    setInverse <- function(inverse){
      inv <<- inverse
    }
  
#returning the list of getter and setter funtions
list(get = get, set = set, getInverse = getInverse, setInverse = setInverse)

}



            
#### creating the cacheSolve function to compute the inverse of a matrix

cacheSolve <- function(x, ...) {

# checking if the object x already has an inverse value assigned to it
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  
# setting the inverse value for the matrix so subsequent calls to this function can use cached data  
  x$setInverse(m)
  m
}


