# A simple knitr example

Here are some trivial R examples that will help to
illustrate how `knitr` works:


```r
z <- 1:10
mean(z)
```

```
## [1] 5.5
```

```r
summary(z)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1.00    3.25    5.50    5.50    7.75   10.00
```

```r
z[z > 5]
```

```
## [1]  6  7  8  9 10
```


The above text was a code block woven into my
description. It gets evaluated and integrated into
the output. Cool, eh?

