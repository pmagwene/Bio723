Figures for Lecture 6 Slides
========================================================



```r
library(MASS)
```


## SVD Example



```r

A <- matrix(c(3, 2, 1, 2), nrow = 2)

pts <- t(expand.grid(c(-1, 0, 1), c(1, 0, -1)))
x <- as.matrix(pts)

l <- 5  # axis limits

f <- x
plot(f[1, ], f[2, ], type = "n", asp = 1, xlim = c(-l, l), ylim = c(-l, l), 
    xlab = "", ylab = "")
text(f[1, ], f[2, ], LETTERS[1:ncol(pts)], col = "red", font = 2, cex = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-21.png) 

```r
dev.copy(pdf, "fig-svdpts.pdf")
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

```r


Ax <- A %*% x
f <- Ax
plot(f[1, ], f[2, ], type = "n", asp = 1, xlim = c(-l, l), ylim = c(-l, l), 
    xlab = "", ylab = "")
text(f[1, ], f[2, ], LETTERS[1:ncol(pts)], col = "red", font = 2, cex = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-22.png) 

```r
dev.copy(pdf, "fig-svdtransform.pdf")
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

```r


s <- svd(A)
U <- s$u
S <- diag(s$d)
Vt <- t(s$v)  # note La.svd returns t(v) in the v object

A
```

```
##      [,1] [,2]
## [1,]    3    1
## [2,]    2    2
```

```r
U
```

```
##         [,1]    [,2]
## [1,] -0.7497 -0.6618
## [2,] -0.6618  0.7497
```

```r
S
```

```
##       [,1]   [,2]
## [1,] 4.131 0.0000
## [2,] 0.000 0.9684
```

```r
Vt
```

```
##         [,1]    [,2]
## [1,] -0.8649 -0.5019
## [2,] -0.5019  0.8649
```

```r


Vtx <- Vt %*% x
f <- Vtx
plot(f[1, ], f[2, ], type = "n", asp = 1, xlim = c(-l, l), ylim = c(-l, l), 
    xlab = "", ylab = "")
text(f[1, ], f[2, ], LETTERS[1:ncol(pts)], col = "red", font = 2, cex = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-23.png) 

```r
dev.copy(pdf, "fig-svd-Vtx.pdf")
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

```r


SVtx <- S %*% Vtx
f <- SVtx
plot(f[1, ], f[2, ], type = "n", asp = 1, xlim = c(-l, l), ylim = c(-l, l), 
    xlab = "", ylab = "")
text(f[1, ], f[2, ], LETTERS[1:ncol(pts)], col = "red", font = 2, cex = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-24.png) 

```r
dev.copy(pdf, "fig-svd-SVtx.pdf")
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

```r

USVtx <- U %*% SVtx
f <- USVtx
plot(f[1, ], f[2, ], type = "n", asp = 1, xlim = c(-l, l), ylim = c(-l, l), 
    xlab = "", ylab = "")
text(f[1, ], f[2, ], LETTERS[1:ncol(pts)], col = "red", font = 2, cex = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-25.png) 

```r
dev.copy(pdf, "fig-svd-USVtx.pdf")
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


## Iris biplot examples


```r

i <- subset(iris, select = -Species)
i.pca <- prcomp(i)

# note that scale = 1 - alpha as I've defined it on my slides

biplot(i.pca, scale = 0, cex = 0.75)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
dev.copy(pdf, "fig-irisbiplot-alpha1.pdf")
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

```r

biplot(i.pca, scale = 0.5, cex = 0.75)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

```r
dev.copy(pdf, "fig-irisbiplot-alpha05.pdf")
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

```r

biplot(i.pca, scale = 1, cex = 0.75)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-33.png) 

```r
dev.copy(pdf, "fig-irisbiplot-alpha0.pdf")
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


## Crab biplot


```r
crab.sub <- subset(crabs, select = c(FL, RW, CL, CW, BD))
crab.pca <- prcomp(crab.sub)

biplot(crab.pca, scale = 0, cex = 0.75)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-41.png) 

```r
dev.copy(pdf, "fig-crabbiplot-alpha1.pdf")
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

```r

biplot(crab.pca, scale = 1, cex = 0.75)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-42.png) 

```r
dev.copy(pdf, "fig-crabbiplot-alpha0.pdf")
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

```r

library(PerformanceAnalytics)
```

```
## Loading required package: zoo
```

```
## Attaching package: 'zoo'
```

```
## The following object(s) are masked from 'package:base':
## 
## as.Date, as.Date.numeric
```

```
## Loading required package: xts
```

```
## Attaching package: 'PerformanceAnalytics'
```

```
## The following object(s) are masked from 'package:graphics':
## 
## legend
```

```r
chart.Correlation(crab.sub)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-43.png) 

```r
dev.copy(pdf, "fig-crab-pairs.pdf")
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



## SVD to PCA


```r
set.seed(100)  # set random number seed


mu = c(0, 0)
sigma = matrix(c(1.1, 0.85, 0.85, 2), nrow = 2, byrow = T)
c <- mvrnorm(100, mu, sigma)

l <- 4
plot(c, asp = 1, pch = 16, xlim = c(-l, l), ylim = c(-l, l), xlab = "", ylab = "")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-51.png) 

```r

c.svd <- svd(c)
U <- c.svd$u
S <- diag(c.svd$d)
Vt <- t(c.svd$v)

plot(U, asp = 1, pch = 16, xlim = c(-l, l), ylim = c(-l, l), xlab = "", ylab = "")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-52.png) 

```r
dev.copy(pdf, "fig-Uplot.pdf")
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

```r

US <- U %*% S
plot(US, asp = 1, pch = 16, xlim = c(-l, l), ylim = c(-l, l), xlab = "", ylab = "")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-53.png) 

```r
dev.copy(pdf, "fig-USplot.pdf")
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

```r


USVt <- U %*% S %*% Vt
plot(USVt, asp = 1, pch = 16, xlim = c(-l, l), ylim = c(-l, l), xlab = "", ylab = "")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-54.png) 

```r
dev.copy(pdf, "fig-USVtplot.pdf")
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


