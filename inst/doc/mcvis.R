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

plot(mcvis_result)

mcvis_result

## -----------------------------------------------------------------------------
library(ggplot2)
ggplot(mcvis_result)

## -----------------------------------------------------------------------------
library(mplot)
data("artificialeg")
X = artificialeg[,1:9]
round(cor(X), 2)

mcvis_result = mcvis(X)
plot(mcvis_result)
ggplot(mcvis_result)

## -----------------------------------------------------------------------------
class(mcvis_result)

## ---- eval = FALSE------------------------------------------------------------
#  shiny_mcvis(mcvis_result)

## -----------------------------------------------------------------------------
sessionInfo()

