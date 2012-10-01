Figures for Lecture 6 Slides
========================================================


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

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

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

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 

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

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-13.png) 

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

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-14.png) 

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

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-15.png) 

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

