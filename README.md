# Sample solution for Individual R Assignment

- SM-2302 Software for Mathematicians
- Semester I 2022/23 (August 2022)

## Rubric

### Code correctness (10 points)

1. `pareto_pdf` must return correct values (checked against `EnvStats::dpareto`)

2. `pareto_pdf` must return 0 for values of `x < beta`

3. `pareto_pdf` must return error for `alpha < 0` and `beta < 0`

4. `pareto_dev` value must return correct values (checked against `EnvStats::dpareto` taken on the log scale)

5. Same as 4, but this checks for vectorisation of `x` (important!)

6. `X` should be loaded using the right data set as a vector

   - -0.5 points when `X` is not a vector
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

## Common mistakes

1. `pareto_pdf` and `pareto_cdf` are not vectorised in `x`.
