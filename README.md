# Assignment #2 Repository

This repository includes the simulated data for Assignment #2. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.<br>

### Summary of Findings: 
See [R markdown output](analysis/analysis.html) for table, figure, and analysis.<br>

I ran a linear regression to assess the relationship of `age` and `cost`, adjusting for `female`, `smoke`, and `cardiac`. `age` was categorized into three groups: 18-29, 30-49, and 50+ for better visualization and interpretability. From our linear model, we see that age is a significant and positive predictor of `cost` and that individuals in older age groups are more likely to pay more `cost` than younger age groups (on average, there seems to be ~200-300 increase in `cost` per age group). The figure shows the distribution of `cost` by `age_cat`.

### AI Statement:
I did not use any generative AI technology to complete any portion of the work.