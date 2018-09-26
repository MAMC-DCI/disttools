## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Load the package.
library(disttools)

# Create some data to play with.
mat <- matrix(rnorm(10), ncol = 2)
mat_dists <- dist(mat)
indices <- matrix(c(1,2,3,2,4,4), ncol = 2, byrow = TRUE)

## ------------------------------------------------------------------------
# Retrieve distances using the matrix-based method.
get_dists(mat_dists, indices)

## ------------------------------------------------------------------------
# Create a matrix of unique index pairs.
index_pairs <- combn(1:3, 2)
index_pairs <- t(index_pairs) # Transpose to put the data in tall format.

# Retrieve the distances as above.
get_dists(mat_dists, index_pairs)

## ------------------------------------------------------------------------
# Create vectors i and j from the above data.
i <- indices[,1]
j <- indices[,2]

# Retrieve distances using the paired vectors method.
get_dists(mat_dists, i, j)

