# disttools
Improved methods for handling 'dist' objects in R.


[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/disttools)](https://cran.r-project.org/package=disttools)
[![Travis-CI Build Status](https://travis-ci.org/MAMC-DCI/disttools.svg?branch=master)](https://travis-ci.org/MAMC-DCI/disttools#)
[![Build status](https://ci.appveyor.com/api/projects/status/xndap91f50c5ou63?svg=true)](https://ci.appveyor.com/project/mamcdci/disttools)
[![Coverage Status](https://img.shields.io/codecov/c/github/mamc-dci/disttools/master.svg)](https://codecov.io/github/mamc-dci/disttools?branch=master)
[![DOI](https://zenodo.org/badge/149624471.svg)](https://zenodo.org/badge/latestdoi/149624471)


## Overview
Working with 'dist' objects in R can be challenging. What makes it challenging is that retrieving the distance between any two points requires specifying a 1 dimensional index. This is non-intuitive and requires the user to write additional code, which slows development and analysis. To avoid this problem, the function *as.matrix* has typically been used to convert a 'dist' object into a matrix. Once converted, distances can be accessed in the same way any element of a matrix is accessed, namely using two indices. Unfortunately, *as.matrix* conversion more than doubles memory usage. For small 'dist' objects this may not be a problem. However, for large 'dist' objects this can be quite problematic. The function *get_dists* in *disttools* solves this problem by facilitating rapid retrieval of the distance between any pair of points stored in a 'dist' object.


## Installation
*disttools* can be installed from CRAN or GitHub by executing either of the following:
```r
# Install from CRAN.
install.packages("disttools")
```


```r
# Install from GitHub.
install.packages("devtools")
devtools::install_github("mamc-dci/disttools")
```


## Usage
The package can be loaded by executing:
```r
# Load the package.
library(disttools)
```


The help file for the function *get_dists* can be accessed by executing:
```r
?get_dists
```


If installed, the package vignette, complete with examples, can be viewed by executing:
```r
browseVignettes("disttools")
```


Alternatively, the vignette is available on the package's CRAN page: [https://CRAN.R-project.org/package=disttools](https://CRAN.R-project.org/package=disttools)


## Disclaimer
The views expressed are those of the author(s) and do not reflect the official policy of the Department of the Army, the Department of Defense or the U.S. Government.
