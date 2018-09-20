# disttools
Improved methods for handling dist objects.


[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/disttools)](https://cran.r-project.org/package=disttools)
[![Travis-CI Build Status](https://travis-ci.org/zcolburn/disttools.svg?branch=master)](https://travis-ci.org/zcolburn/disttools)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/zcolburn/disttools?branch=master&svg=true)](https://ci.appveyor.com/project/zcolburn/disttools)
[![Coverage Status](https://img.shields.io/codecov/c/github/zcolburn/disttools/master.svg)](https://codecov.io/github/zcolburn/disttools?branch=master)


## Objective
Functions that determine the distances between objects typically return either an object of class ‘dist’ or a matrix. When a matrix is returned, there is wasted memory because a distance matrix is symmetric across the diagonal (top left to bottom right). On the other hand, a ‘dist’ object, while more memory efficient, is inconvenient because its distance information can only be accessed using a one dimensional index. Accessing the distance between any two data points therefore requires either coercing the ‘dist’ object to a matrix using *as.matrix*. or calculating the one dimensional index that corresponds to the two data points of interest. When working with very large ‘dist’ objects the former may not be feasible. The package *disttools* provides a simple interface for accessing the distances contained within a distance matrix without the memory overhead of *as.matrix* coercion.


The function *get_dists* in this package is the workhorse of this operation.

## Installation
The latest version of *disttools* can be installed by executing the following.
```r
# Install from GitHub.
install.packages("devtools")
devtools::install_github("zcolburn/disttools")

# Install from CRAN.
install.packages("disttools")
```


## Usage
The function *get_dists* allows distances to be accessed for different pairs of points in two ways, demonstrated below.
```{r}
# Load the package.
library(disttools)

# Create some data to play with.
mat <- matrix(rnorm(10), ncol = 2)
mat_dists <- dist(mat)
indices <- matrix(c(1,2,3,2,4,4), ncol = 2, byrow = TRUE)

# Retrieve distances using the matrix-based method.
get_dists(mat_dists, indices)
```


Alternatively, the data can be accessed using a pair of vectors.
```{r}
# Create vectors i and j from the above data.
i <- indices[,1]
j <- indices[,2]

# Retrieve distances using the paired vectors method.
get_dists(mat_dists, i, j)
```