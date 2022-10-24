# Load libraries ---------------------------------------------------------------
library(tidyverse)              

# Q1 ---------------------------------------------------------------------------
pareto_pdf <- function(x, alpha, beta) {
  # First test for invalid parameter values
  if (alpha <= 0 | beta <= 0)
    stop("Parameters alpha and beta must be > 0.")
  
  # The Pareto pdf
  res <- alpha * beta ^ alpha / x ^ (alpha + 1)
  res[x < beta] <- 0  # pdf is zero when x < beta
  return(res)
}

# Some tests:
# pareto_pdf(10, 5, 5)
# pareto_pdf(10:15, 5, 5)  # it's vectorised too

