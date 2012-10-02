Workbook Chap 6 figures
========================================================

Read image

```r

library(jpeg)
img <- readJPEG("../../datasets/chesterbw.jpg")

dim(img)
```

```
## [1] 556 605
```

```r
typeof(img)
```

```
## [1] "double"
```

```r
class(img)
```

```
## [1] "matrix"
```


Draw original image

```r
ny <- dim(img)[1]  # rasterImage will draw rows along vertical axis
nx <- dim(img)[2]
max.pixels <- max(nx, ny)

# plot(0:max.pixels, 0:max.pixels, type='n', xlab='', ylab='',asp=1)
# rasterImage(img, 0, 0, nx, ny)

library(grid)  # provides grid.raster function
grid.raster(img)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

```r
dev.copy(pdf, "fig-chesterorig.pdf")
```

```
## pdf 
##   3
```

```r
dev.off()
```

```
## pdf 
##   2
```


Create approximating image using SVD

```r

img.svd <- svd(img)
U <- img.svd$u
S <- diag(img.svd$d)
Vt <- t(img.svd$v)

U15 <- U[, 1:15]  # first 15 left singular vectors
S15 <- S[1:15, 1:15]  # first 15 singular values
Vt15 <- Vt[1:15, ]  # first 15 right singular values, NOTE: we're getting rows rather than columns here

approx15 <- U15 %*% S15 %*% Vt15
nx <- dim(img)[2]
ny <- dim(img)[1]
# plot(0:max.pixels, 0:max.pixels, type='n', xlab='', ylab='',asp=1)
# rasterImage(approx15, 0, 0, nx, ny)
grid.raster(approx15)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

```r
dev.copy(pdf, "fig-chesterapprox15.pdf")
```

```
## pdf 
##   3
```

```r
dev.off()
```

```
## pdf 
##   2
```




## Writing our own PCA function


```r

# a user defined version of principal components analysis
PCA <- function(X, center = T, scale = F) {
    x <- scale(X, center = center, scale = scale)
    n <- nrow(x)
    p <- ncol(x)
    
    x.svd <- svd(x)
    U <- x.svd$u
    S <- diag(x.svd$d)
    V <- x.svd$v
    
    # check for zero eigenvalues
    zeros <- rep(0, p)
    tolerance = .Machine$double.eps^0.5
    has.zero.singval <- any(x.svd$d <= tolerance)
    if (has.zero.singval) 
        print("WARNING: Zero singular values detected")
    
    pc.scores <- U %*% S
    pc.sdev <- diag(sqrt((S^2/(n - 1))))
    return(list(vectors = V, scores = pc.scores, sdev = pc.sdev))
}
```

