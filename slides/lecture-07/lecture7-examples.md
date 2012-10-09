


```r
y <- c(20, 17, 17, 21, 16, 14, 17, 16, 15, 8, 11, 8)
y <- matrix(y, nrow = length(y))

n <- length(y)
ones <- rep(1, n)
g0 <- c(1, 1, 1)
notg0 <- c(0, 0, 0)
lastg0 <- c(-1, -1, -1)

x1 <- c(g0, notg0, notg0, lastg0)
x2 <- c(notg0, g0, notg0, lastg0)
x3 <- c(notg0, notg0, g0, lastg0)

X <- matrix(c(ones, x1, x2, x3), nrow = n)
```




```r

b <- solve(t(X) %*% X) %*% t(X) %*% y
b
```

```
##      [,1]
## [1,]   15
## [2,]    3
## [3,]    2
## [4,]    1
```

```r

yhat <- X %*% b
yhat.ctr <- yhat - mean(yhat)
len.yhat <- t(yhat.ctr) %*% yhat.ctr
dim.yhat <- 3

e <- y - yhat
len.e <- t(e) %*% e
dim.e <- 8

F <- (dim.e * len.yhat)/(dim.yhat * len.e)
F
```

```
##      [,1]
## [1,]   10
```


Here's the how to do this in R:


```r

groups <- c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4)
group.factor <- as.factor(groups)

lm.dummy <- lm(y ~ group.factor)
anova(lm.dummy)
```

```
## Analysis of Variance Table
## 
## Response: y
##              Df Sum Sq Mean Sq F value Pr(>F)   
## group.factor  3    150      50      10 0.0044 **
## Residuals     8     40       5                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
summary(lm.dummy)
```

```
## 
## Call:
## lm(formula = y ~ group.factor)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
##  -3.00  -1.00  -1.00   1.25   4.00 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      18.00       1.29   13.94  6.8e-07 ***
## group.factor2    -1.00       1.83   -0.55   0.5988    
## group.factor3    -2.00       1.83   -1.10   0.3052    
## group.factor4    -9.00       1.83   -4.93   0.0012 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 2.24 on 8 degrees of freedom
## Multiple R-squared: 0.789,	Adjusted R-squared: 0.711 
## F-statistic:   10 on 3 and 8 DF,  p-value: 0.00441
```


The ANOVA table looks the same as what I presented in the slides, but the model coefficients don't look the same because by default `lm()` uses dummy coding. We use the `contrasts` function to see how R creates contrasts from our grouping variable. 


```r
contrasts(group.factor)
```

```
##   2 3 4
## 1 0 0 0
## 2 1 0 0
## 3 0 1 0
## 4 0 0 1
```


To see the actual matrix, X, that `lm()` creates to fit the linear model, use `model.matrix()`:


```r
model.matrix(~group.factor)  # note the use of tilde (see below)
```

```
##    (Intercept) group.factor2 group.factor3 group.factor4
## 1            1             0             0             0
## 2            1             0             0             0
## 3            1             0             0             0
## 4            1             1             0             0
## 5            1             1             0             0
## 6            1             1             0             0
## 7            1             0             1             0
## 8            1             0             1             0
## 9            1             0             1             0
## 10           1             0             0             1
## 11           1             0             0             1
## 12           1             0             0             1
## attr(,"assign")
## [1] 0 1 1 1
## attr(,"contrasts")
## attr(,"contrasts")$group.factor
## [1] "contr.treatment"
```


We can also use `contrasts()` in combination with `contr.sum` to change this to effect coding. The argument to `contr.sum()` should be the total number of groups:


```r
contrasts(group.factor) <- contr.sum(4)
model.matrix(~group.factor)  # see how it's changed
```

```
##    (Intercept) group.factor1 group.factor2 group.factor3
## 1            1             1             0             0
## 2            1             1             0             0
## 3            1             1             0             0
## 4            1             0             1             0
## 5            1             0             1             0
## 6            1             0             1             0
## 7            1             0             0             1
## 8            1             0             0             1
## 9            1             0             0             1
## 10           1            -1            -1            -1
## 11           1            -1            -1            -1
## 12           1            -1            -1            -1
## attr(,"assign")
## [1] 0 1 1 1
## attr(,"contrasts")
## attr(,"contrasts")$group.factor
##   [,1] [,2] [,3]
## 1    1    0    0
## 2    0    1    0
## 3    0    0    1
## 4   -1   -1   -1
```



```r
lm.effects <- lm(y ~ group.factor)
anova(lm.effects)
```

```
## Analysis of Variance Table
## 
## Response: y
##              Df Sum Sq Mean Sq F value Pr(>F)   
## group.factor  3    150      50      10 0.0044 **
## Residuals     8     40       5                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
summary(lm.effects)
```

```
## 
## Call:
## lm(formula = y ~ group.factor)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
##  -3.00  -1.00  -1.00   1.25   4.00 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     15.000      0.645   23.24  1.2e-08 ***
## group.factor1    3.000      1.118    2.68    0.028 *  
## group.factor2    2.000      1.118    1.79    0.111    
## group.factor3    1.000      1.118    0.89    0.397    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 2.24 on 8 degrees of freedom
## Multiple R-squared: 0.789,	Adjusted R-squared: 0.711 
## F-statistic:   10 on 3 and 8 DF,  p-value: 0.00441
```




