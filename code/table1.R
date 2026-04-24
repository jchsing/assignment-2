## table1.R ----

## IMPORTS ----
#### if need to install packages, run below
# install.packages("here")
# install.packages("readr")
# install.packages("tidyverse")
# install.packages("table1")
# install.packages("knitr")
# install.packages("webshot2")
# install.packages("kableExtra")

library(here)
library(tidyverse)
library(readr)
library(table1)
library(knitr)
library(webshot2)
library(kableExtra)

## CONSTANTS ----


## LOAD DATA ----
raw_data <- read_csv(here("raw-data", "cohort.csv"))
glimpse(raw_data)

## FUNCTIONS ----


## TABLE 1 ----
tb1_df <- 
    raw_data |> 
    mutate(
        smoke = factor(smoke), 
        female = factor(female), 
        cardiac = factor(cardiac)
    )


tb1 <- 
    table1(
    ~ age + 
        female + 
        cost + 
        smoke | 
        cardiac,
    data = tb1_df
) |> 
    kable()

as_image(tb1, file = here("outputs", "table1.md"))

