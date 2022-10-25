# Sample solution for Individual R Assignment

- SM-2302 Software for Mathematicians
- Semester I 2022/23 (August 2022)

## Common mistakes

1. `pareto_pdf` and `pareto_cdf` are not vectorised in `x`. No marks were deducted, but it would have been easier for plotting purposes (say) if you were able to input a vector `x` and return pdf/cdf vector values.

2. A number still struggled with assigning functions. In R, the syntax is 

   ```r
   my_fun <- function(x, y, z) {
      # The code to do onto x y z and save in result
      return(result)
   }
   ```

   Instead, the following was all too common: `my_fun(x, y, z) <- { ... }`

3. When checking for argument validity, it's best to `stop()` the function right at the beginning, as soon as the invalid values are detected. Note that `if` is **not** vectorised. Meaning that if you have `if(x < beta)` or something of the sort, then it's likely going to fail.

   - By the way, valid parameter values are `alpha > 0` and `beta > 0`; not $\geq$!

   - Also, instead of an `if` statement, why not just set the output value based on subsetting? See the solution R script.

4. Loading data sets can be done in a variety of ways: `read.csv`, `read.table`, `scan`, etc. When this is run, the data txt file should be in the repo, but it was missing for some.

5. The cdf was defined as $F:\mathbb R \to [0,1]$, so it is not possible for the cdf to return values less than zero (or greater than 1 for that matter). 

6. Question 5 saw the fewest correct answers. The idea is to "reverse" the cdf to obtain $q_1,\dots,q_5$, since $F(q_3)=0.5$ for instance, we are looking for the `x` value which results in `pareto_cdf(x) = 0.5`. The instructions was to use loops, because if we can create a vector of values `seq(xmin, xmax, length.out = B)` where `B <- 1000` for example, **one of these `x` values is bound to be quite close to 0.5**. Thus it is a matter of subsetting which `x` value it is. See the solution for more details.

7. Avoid assigning `F <- ...` because `F` is meant to be for `FALSE`.

## Rubric

### Code correctness (10 points)

1. `pareto_pdf` must return correct values (checked against `EnvStats::dpareto`)

   - Points awarded if attempt is valid but value incorrect (e.g. return character vector instead)

2. `pareto_pdf` must return 0 for values of `x < beta`

3. `pareto_pdf` must return error for `alpha < 0` and `beta < 0`

4. `pareto_dev` value must return correct values (checked against `EnvStats::dpareto` taken on the log scale)

   - Points awarded if attempt is valid but value incorrect (e.g. return character vector instead)

5. Same as 4, but this checks for vectorisation of `x` (important!)

6. `X` should be loaded using the right data set as a vector

   - -0.5 points when `X` is not a vector
   - -0.5 points if data file not in repo
   - -1 point if no attempt to load `X` is seen in code

7. `alpha_hat` is present and value is correct

   - Points awarded if attempt is valid but value incorrect (e.g. Fail tests because `X` incorrectly loaded)

8. `beta_hat` is present and value is correct 

   - Points awarded if attempt is valid but value incorrect (e.g. Fail tests because `X` incorrectly loaded)

9. `pareto_cdf` value must return correct values (checked against `EnvStats::ppareto`)
   
   - -0.5 points if cdf is less than zero (i.e. did not zero out values `x < beta`)

10. Return correct quantile values
   
    - Points awarded if attempt is valid but value incorrect


### Code styling

| 0-1                                                              | 2-3                                     | 4-5                                |
|------------------------------------------------------------------|-----------------------------------------|------------------------------------|
| Messy code and hard to read;  no spaces/tabs;  no section breaks | Some attempts at making script readable | Adherence to tidyverse style guide |

### Creativity

| 0-1                                     | 2-3                             | 4-5                                                              |
|-----------------------------------------|---------------------------------|------------------------------------------------------------------|
| Uninspired code copied from some source | Standard and practical solution | Elegant and unique solution; Noteworthy presentation in R script |

### Use of GitHub

| 0-1                        | 2-3                                   | 4-5                                                                     |
|----------------------------|---------------------------------------|-------------------------------------------------------------------------|
| Single or few commits only | Regular commits; Lazy commit messages | Commits are regular; Messages are informative; GitHub features are used |

### Following instructions

| 0-1                                                           | 2-3                               | 4-5                                                          |
|---------------------------------------------------------------|-----------------------------------|--------------------------------------------------------------|
| Code unable to be run without errors; Ignoring variable names | Code runs; Variable names ignored | Entire code runs without errors; Variable names are followed |


