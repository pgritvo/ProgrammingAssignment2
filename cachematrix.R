## The first function, makeCacheMatrix creates a special "vector",

## which is really a list containing a function to

##

## set the value of the matrix

## get the value of the matrix

## set the value of the inverted matrix

## get the value of the inverteed matrix




makeCacheMatrix <- function(x = matrix()) {

        sol <- NULL

        set <- function(y) {

                x <<- y

                sol <<- NULL

        }

        get <- function() x

        setsolved <- function(solved) sol <<- solved

        getsolved <- function() sol

        list(set = set, get = get,

             setsolved = setsolved,

             getsolved = getsolved)

}




## The following function calculates the inverted matrix. However, it first checks to see if

## the inverted matrix has already been calculated. If so, it gets the inverted matrix from the

## cache and skips the computation. Otherwise, it calculates the inverted matrix and sets its value

## in the cache via the setsolved function.




cachesolve <- function(x, ...) {

        sol <- x$getsolved()

        if(!is.null(sol)) {

                message("getting cached data")

                return(sol)

        }

        data <- x$get()

        sol <- solve(data, ...)

        x$setsolved(sol)

        sol

}
