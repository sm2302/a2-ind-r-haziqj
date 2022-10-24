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

# Q2 ---------------------------------------------------------------------------
pareto_dev <- function(alpha, beta, x) {
  # First test for invalid parameter values
  if (alpha <= 0 | beta <= 0)
    stop("Parameters alpha and beta must be > 0.")
  
  # Return the log-likelihood
  res <- -2 * log(alpha) - 2 * alpha * log(beta) + 
    2 * (alpha + 1) * log(x[x > beta])  # only interested in values for which
                                        # x > beta
  sum(res)
}

# Some tests:
# pareto_dev(2, 2, 2:10)
# sum(-2 * log(pareto_pdf(x = 2:10, alpha = 2, beta = 2)))

# Note: It's fine to do sum(-2 * log(pareto_pdf)), but it breaks down easily
# because the pdf explodes with large values of alpha. Better to use log scale
# directly.

# Q3 ---------------------------------------------------------------------------
# Generate some Pareto random variables
set.seed(123)
X <- rpareto(100, location = 8, shape = 3) 

beta_hat <- min(X)
res <- optim(5, pareto_dev, method = "L-BFGS-B", lower = 0 + 1e-5, x = X, 
             beta = beta_hat)
alpha_hat <- res$par

# Alternatively, can code the alpha_hat directly based on the formulae from
# Wikipedia or differentiation by hand.

















