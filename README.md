# Assignment #2 & #4 Repository

This repository includes the simulated data for Assignment #2 and #4.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.<br>

### Update of findings (assignment 4): 
See [rendered pdf of reproducible report](epi203-reproducible-report.pdf).

See [qmd file with code](epi203-reproducible-report.qmd)

### Summary of Findings (assignment 2): 
See [R markdown output](analysis-for-assignmnet-2/analysis.md) for table, figure, and analysis specific for Assignment 2.<br>

I ran a linear regression to assess the relationship of `age` and `cost`, adjusting for `female`, `smoke`, and `cardiac`. `age` was categorized into three groups: 18-29, 30-49, and 50+ for better visualization and interpretability. From our linear model, we see that age is a significant and positive predictor of `cost` and that individuals in older age groups are more likely to pay more `cost` than younger age groups (on average, there seems to be ~200-300 increase in `cost` per age group). The figure shows the distribution of `cost` by `age_cat`.

### AI Statement:
I did not use any generative AI technology to complete any portion of the work.