Assignment 2
================

#### Imports

``` r
library(here)
library(tidyverse)
library(readr)
library(table1)
library(ggplot2)
```

#### Load Data

``` r
raw_data <- read_csv(here("raw-data", "cohort.csv"))
```

    Rows: 5000 Columns: 5
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    dbl (5): smoke, female, age, cardiac, cost

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
glimpse(raw_data)
```

    Rows: 5,000
    Columns: 5
    $ smoke   <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
    $ female  <dbl> 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1,…
    $ age     <dbl> 49, 40, 48, 44, 25, 39, 55, 41, 57, 50, 44, 31, 65, 44, 28, 48…
    $ cardiac <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
    $ cost    <dbl> 9542, 8849, 9233, 9507, 8585, 9507, 9690, 9666, 9316, 9597, 94…

#### 1. Table

``` r
df <- 
    raw_data |> 
    mutate(
        smoke = factor(smoke, 
                       levels = c(0,1), 
                       labels = c("no", "yes")), 
        female = factor(female, 
                        levels = c(0,1), 
                        labels = c("no", "yes")), 
        cardiac = factor(cardiac, 
                         levels = c(1,0), 
                         labels = c("cardiac event", "no cardiac event"))
    ) |> 
    mutate(
        age_cat = case_when(
        age < 30 ~ "18-29", 
        age >= 30 & age < 50 ~ "30-49", 
        age >= 50 ~ "50+", 
        TRUE ~ NA_character_
    ))


tb1 <- table1(~ age_cat + female + cost + smoke + cardiac, data = df) |> 
    as.data.frame()

knitr::kable(tb1)
```

|                     | Overall              |
|:--------------------|:---------------------|
|                     | (N=5000)             |
| age_cat             |                      |
| 18-29               | 1078 (21.6%)         |
| 30-49               | 1841 (36.8%)         |
| 50+                 | 2081 (41.6%)         |
| female              |                      |
| no                  | 2134 (42.7%)         |
| yes                 | 2866 (57.3%)         |
| cost                |                      |
| Mean (SD)           | 9400 (448)           |
| Median \[Min, Max\] | 9380 \[8010, 11400\] |
| smoke               |                      |
| no                  | 4354 (87.1%)         |
| yes                 | 646 (12.9%)          |
| cardiac             |                      |
| cardiac event       | 275 (5.5%)           |
| no cardiac event    | 4725 (94.5%)         |

#### 2. Analysis: linear regression

``` r
model <- glm(cost ~ age_cat + female + smoke + cardiac, data = df)
summary(model)
```


    Call:
    glm(formula = cost ~ age_cat + female + smoke + cardiac, data = df)

    Coefficients:
                            Estimate Std. Error t value Pr(>|t|)    
    (Intercept)             9635.759     17.252  558.52   <2e-16 ***
    age_cat30-49             266.871      9.503   28.08   <2e-16 ***
    age_cat50+               622.472      9.302   66.92   <2e-16 ***
    femaleyes               -272.897      7.276  -37.51   <2e-16 ***
    smokeyes                 507.782     10.826   46.90   <2e-16 ***
    cardiacno cardiac event -533.556     16.326  -32.68   <2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    (Dispersion parameter for gaussian family taken to be 61380.08)

        Null deviance: 1001507897  on 4999  degrees of freedom
    Residual deviance:  306532098  on 4994  degrees of freedom
    AIC: 69322

    Number of Fisher Scoring iterations: 2

#### 3. Figure:

``` r
df |> 
    ggplot() + 
    geom_boxplot(aes(x = age_cat, y = cost, color = age_cat, fill = age_cat), 
                 alpha = 0.2) + 
    labs(x = "Age Category (years)", 
         y = "Cost (dollars)", 
         color = NULL, fill = NULL) 
```

![](../outputs/figures/figure%201-1.png)<!-- -->

#### 4. Summary:

I ran a linear regression to assess the relationship of `age` and
`cost`, adjusting for `female`, `smoke`, and `cardiac`. `age` was
categorized into three groups: 18-29, 30-49, and 50+ for better
visualization and interpretability. From our linear model, we see that
age is a significant and positive predictor of `cost` and that
individuals in older age groups are more likely to pay more `cost` than
younger age groups (on average, there seems to be ~200-300 increase in
`cost` per age group). The figure shows the distribution of `cost` by
`age_cat`.

### AI Statement:

I did not use any generative AI technology to complete any portion of
the work.
