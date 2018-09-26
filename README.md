# disttools
Improved methods for handling dist objects.


[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/disttools)](https://cran.r-project.org/package=disttools)
[![Travis-CI Build Status](https://travis-ci.org/zcolburn/disttools.svg?branch=master)](https://travis-ci.org/zcolburn/disttools)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/zcolburn/disttools?branch=master&svg=true)](https://ci.appveyor.com/project/zcolburn/disttools)
[![Coverage Status](https://img.shields.io/codecov/c/github/zcolburn/disttools/master.svg)](https://codecov.io/github/zcolburn/disttools?branch=master)
[![](https://cranlogs.r-pkg.org/badges/disttools)](https://cran.r-project.org/package=disttools)


## Objective
Working with 'dist' objects in R can be challenging. Specifically, retrieving the distance between any two points is a challenge because values in 'dist' objects can only be accessed using a 1 dimensional index. To avoid this problem, the function *as.matrix* can be used to convert a 'dist' object into a matrix. Once converted, distances can be accessed in the same way any element of a matrix is accessed. However, *as.matrix* conversion more than doubles memory usage. For small 'dist' objects this may not be a problem. For large 'dist' objects this can be quite problematic. The function *get_dists* in *disttools* solves this problem by facilitating rapid retrieval of the distance between any pair of points.


## Installation
*disttools* can be installed from CRAN or GitHub by executing either of the following:
```r
# Install from CRAN.
install.packages("disttools")

# Install from GitHub.
install.packages("devtools")
devtools::install_github("zcolburn/disttools")
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