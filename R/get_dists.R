#' Retrieve the distances between i and j from a 'dist' object.
#'
#' @param x An object of class 'dist'.
#' @param i Either a two column matrix of integer indices or a vector of
#' indices that are paired with the corresponding elements in j.
#' @param j A vector of indices where each element forms a pair with the
#' corresponding element in argument i.
#' @param return_indices Logical indicating whether a three column matrix
#' containing the provided indices (columns 1 and 2) and their corresponding
#' distances (column 3) should be returned. The default behavior is to return
#' a vector of distances.
#'
#' @return A vector giving the distances between the provided indices.
#'
#' @export
#'
#' @examples
#' test <- matrix(rnorm(20), ncol = 2)
#' test_dists <- dist(test)
#' indices <- matrix(sample(1:8),ncol=2)
#' get_dists(test_dists, indices)
get_dists <- function(x, i, j = NULL, return_indices = FALSE){
  # Determine whether j was supplied or not.
  j_supplied <- !is.null(j)

  if(is.null(return_indices)){
    stop("return_indices must be TRUE or FALSE.")
  }
  return_indices <- as.logical(return_indices)[1]
  if(is.na(return_indices)){stop("return_indices cannot be NA.")}

  # Check that x is a dist object.
  if(
    is.null(x) ||
    !((length(class(x)) == 1) && (class(x) == "dist"))
  ){
    stop(
      "
      x must be an object of class 'dist'.
      "
    )
  }

  # Retrieve the size of x.
  size <- attr(x,"Size")

  if(is.null(i)){
    stop("Argument i cannot be NULL.")
  }

  # If j is not null then check and merge i and j into a matrix.
  if(!is.null(j)){
    if(
      !(
        (length(class(i)) == 1) && (length(class(j)) == 1) &&
        ((class(i) == "numeric") || (class(i) == "integer")) &&
        ((class(j) == "numeric") || (class(j) == "integer")) &&
        all(as.integer(i) == i) && all(as.integer(j) == j) &&
        (length(i) == length(j))
      )
    ){
      stop(
        "
        If both i and j are supplied, then both must be equal length integer or
        numeric vectors.
        "
      )
    }else{
      # Create a matrix i from vectors i and j.
      i <- matrix(c(i,j), ncol = 2)
    }
  }

  # Check that the input indices are valid.
  if(
    !(
      (
        (class(i) == "matrix") &&
        ((class(i[1]) == "numeric") || (class(i[1]) == "integer")) &&
        all(as.integer(i) == i) &&
        all((i >= 1) & (i <= size))
      )
    )
  ){
    if(j_supplied){
      stop("Vector arguments i and j must be integers between 1 and
           attr(x, 'Size')")
    }else{
      stop(
        "i must be a two column matrix filled with integers between 1 and
        attr(x, 'Size'), inclusive"
      )
    }
  }

  # Sort the indices within each row.
  left_smaller <- i[,1] < i[,2]
  right_smaller <- !left_smaller

  s <- numeric(nrow(i))
  b <- s

  s[left_smaller] <- i[left_smaller,1]
  s[right_smaller] <- i[right_smaller,2]

  b[left_smaller] <- i[left_smaller,2]
  b[right_smaller] <- i[right_smaller,1]

  # Determine the indices to retrieve.
  linear_index <- 0.5*size*(size-1)-0.5*(size-s)*(size-s-1)-(size-b)

  # For cases where s == b, ensure that the output gets set to 0. Ensure that
  # the output equals the corresponding distance everywhere else.
  linear_index[s == b] <- NA
  output <- x[linear_index]
  output[is.na(output)] <- 0

  # Create the final output.
  if(return_indices){
    output <- matrix(c(s,b,output), ncol = 3)
    colnames(output) <- c("Small_Index","Large_Index","Distance")
  }

  # Return the values.
  return(output)
}
