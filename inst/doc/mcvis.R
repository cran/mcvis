## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=FALSE, message=FALSE--------------------------------------
## Simulating some data
set.seed(1)
p = 6
n = 100

X = matrix(rnorm(n*p), ncol = p)
X[,1] = X[,2] + X[,3] + rnorm(n, 0, 0.01)

y = rnorm(n)
summary(lm(y ~ X))

## -----------------------------------------------------------------------------
library(mcvis)
mcvis_result = mcvis(X = X)

mcvis_result

## -----------------------------------------------------------------------------
plot(mcvis_result)

## -----------------------------------------------------------------------------
plot(mcvis_result, type = "igraph")

## -----------------------------------------------------------------------------
## Simulation taken from the `mplot` package.
## Generating a data with multi-collinearity. 
n=50
set.seed(8) # a seed of 2 also works
x1 = rnorm(n,0.22,2)
x7 = 0.5*x1 + rnorm(n,0,sd=2)
x6 = -0.75*x1 + rnorm(n,0,3)
x3 = -0.5-0.5*x6 + rnorm(n,0,2)
x9 = rnorm(n,0.6,3.5)
x4 = 0.5*x9 + rnorm(n,0,sd=3)
x2 = -0.5 + 0.5*x9 + rnorm(n,0,sd=2)
x5 = -0.5*x2+0.5*x3+0.5*x6-0.5*x9+rnorm(n,0,1.5)
x8 = x1 + x2 -2*x3 - 0.3*x4 + x5 - 1.6*x6 - 1*x7 + x9 +rnorm(n,0,0.5)
y = 0.6*x8 + rnorm(n,0,2)
artificialeg = round(data.frame(x1,x2,x3,x4,x5,x6,x7,x8,x9,y),1)

## -----------------------------------------------------------------------------
X = artificialeg[,1:9]
round(cor(X), 2)

mcvis_result = mcvis(X)
mcvis_result
plot(mcvis_result)

## -----------------------------------------------------------------------------
class(mcvis_result)

## ---- eval = FALSE------------------------------------------------------------
#  shiny_mcvis(mcvis_result)

## -----------------------------------------------------------------------------
sessionInfo()

